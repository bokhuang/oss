package controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import domain.Power;
import domain.Role;
import domain.User;
import domain.UserRoleChoice;
import net.sf.json.JSONArray;
import service.PowerService;
import service.RolePowerService;


@Controller
public class PowerController {
@Autowired
	private PowerService powerservice;
@Autowired
private RolePowerService rolepowerservice;
	//根据登录时用户id查找用户的功能列表，返回主界面呈现树结构功能列表
	@RequestMapping("/findpowers")
	public ModelAndView findPowers(int user_id,HttpSession session) {
		ModelAndView modelAndView;
		List<Power> powers= powerservice.executeFindPowerList(user_id);
		modelAndView = new ModelAndView("forward:/common/main.html");
		modelAndView.addObject("powers", powers);
		session.setAttribute("powers", powers);
		return modelAndView;
	}
	
	//查找所有功能信息,返回查询页面
	@RequestMapping("/powersAction")
	public ModelAndView findPowers(Power power,HttpSession session) {
		ModelAndView modelAndView;
		List<Power> powers=powerservice.findPowers(power);
		if(powers!=null){
			modelAndView=new ModelAndView("forward:/manager/powermanager/PowerQuery.jsp");
			modelAndView.addObject("powers",powers) ;
			session.setAttribute("powers", powers);
		}else{
			modelAndView=new ModelAndView("forward:/error.jsp");
		}
		return modelAndView;
	}
	//查找所有功能信息，返回角色增加页面
	@RequestMapping("/findallpowersAction")
	public ModelAndView findallpowersAction(Power power,HttpSession session) {
		ModelAndView modelAndView;
		List<Power> powers=powerservice.findPowers(power);
		if(powers!=null){
			modelAndView=new ModelAndView("forward:/manager/rolemanager/AddRole.jsp");
			modelAndView.addObject("powers",powers) ;
			session.setAttribute("powers",powers);
			System.out.println("---------powerspowerspowers"+powers.size());
		}else{
			modelAndView=new ModelAndView("forward:/error.jsp");
		}
		return modelAndView;
	}
	
	//修改查找id
	/* 先根据角色id找要修改的角色，再根据角色id查找所有功能id,最后找到功能id的name显示到修改页面*/
	@RequestMapping("/modifyfindAllPowerNames")
	public ModelAndView modifyfindAllPowerNames(HttpSession session) {
		ModelAndView modelAndView;
		Power nullpower=new Power();
		List<Power> powers=powerservice.findPowers(nullpower);
		System.out.println("------------所有功能数nullpower"+powers);
		session.setAttribute("powers",powers);
		if(session.getAttribute("flag").equals(1)){
			modelAndView=new ModelAndView("forward:/manager/rolemanager/ReadRole.jsp");
		}else{
			modelAndView=new ModelAndView("forward:/manager/rolemanager/UpdateRole.jsp");
		}
		session.removeAttribute("flag");
		return modelAndView;
		}
	
	//增加功能
	@RequestMapping("/addPowerAction")
	public ModelAndView addaPower(Power power) {
		ModelAndView modelAndView;	
		boolean ret =powerservice.addPower(power);
		if(ret){
			modelAndView=new ModelAndView("redirect:/powersAction");
		}else{
			modelAndView=new ModelAndView("forward:/error.jsp");
		}
		return modelAndView;
	}
	//修改查找id
	@RequestMapping("/findPowerByIdAction")
	public ModelAndView findPowerByIdAction(Integer power_id,Integer flag,HttpSession session) {
		ModelAndView modelAndView;
		Power modifypower= powerservice.findOnePowerById(power_id);
		if(flag.equals(1)){
			modelAndView=new ModelAndView("forward:/manager/powermanager/ReadPower.jsp");
		}else{
			modelAndView=new ModelAndView("forward:/manager/powermanager/UpdatePower.jsp");
		}
		modelAndView.addObject("modifypower",modifypower);
		session.setAttribute("modifypower",modifypower);
			return modelAndView;
		}
	
	//修改
	@RequestMapping("/updatePowerAction")
	public ModelAndView updatePower(Power modifypower,HttpSession session) {
		ModelAndView modelAndView;
		//更新功能表
		boolean ret1 = powerservice.updatePower(modifypower);
		modelAndView=new ModelAndView("redirect:/powersAction");
		return modelAndView;
	}
	//删除deletePowerByIdAction
	@RequestMapping("/deletePowerByIdAction")
	public ModelAndView deletePowerById(Integer power_id){
		ModelAndView modelAndView;	
		boolean ret1 = powerservice.deletePowerById(power_id);//删除power
		boolean ret2=rolepowerservice.deleterolepowerBypowerId(power_id);//删除rolepower
		modelAndView=new ModelAndView("redirect:/powersAction");
		return modelAndView;
	}
	
	
}
