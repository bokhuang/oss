package controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import domain.Role;
import domain.RolePowerChoice;
import domain.UserRoleChoice;
import service.RolePowerService;
import service.RoleService;
import service.UserRoleService;

@Controller
public class RoleController {
	@Autowired
	private RoleService roleservice;
	@Autowired
	private UserRoleService userroleservice;
	@Autowired
	private RolePowerService rolepowerservice;
	//增加用户时，查找所有角色信息，供赋予用户角色
	@RequestMapping("/findAllRoles")
	public ModelAndView findallroles(Role role,HttpSession session) {
		ModelAndView modelAndView;
		List<Role> roles=roleservice.execute(role);
		modelAndView=new ModelAndView("forward:/manager/usermanager/AddUser.jsp");
		modelAndView.addObject("roles", roles) ;
		session.setAttribute("roles", roles);
		System.out.println("--------------------------------------"+roles);
		return modelAndView;
		}
	
	/* 先根据用户id找用户，再找所有角色id,最后根据角色id找到该用户角色name显示到修改页面*/
	@RequestMapping("/modifyfindAllRoleNames")
	public ModelAndView modifyfindallrolenames(HttpSession session) {
		ModelAndView modelAndView;
		Role nullrole=new Role();
		List<Role> roles=roleservice.execute(nullrole);
		System.out.println("------------所有角色数nullrole"+roles);
		session.setAttribute("roles", roles);
		if(session.getAttribute("flag").equals(1)){
		modelAndView=new ModelAndView("forward:/manager/usermanager/ReadUser.jsp");
		}else{
			modelAndView=new ModelAndView("forward:/manager/usermanager/UpdateUser.jsp");
		}
		session.removeAttribute("flag");
		return modelAndView;
		}
	
	//查找所有roles信息，可根据参数（名字）查
	@RequestMapping("/rolesAction")
	public ModelAndView findrolesAction(Role role,HttpSession session) {
		ModelAndView modelAndView;
		List<Role> roles=roleservice.execute(role);
		modelAndView=new ModelAndView("forward:/manager/rolemanager/RoleQuery.jsp");
		modelAndView.addObject("roles", roles) ;
		session.setAttribute("roles", roles);
		System.out.println("--------------------------------------"+roles);
		return modelAndView;
		}
	/* 增加角色，同时增加角色功能*/
	/* 先增加，再查询该角色id传到角色功能表，循环加入页面勾选的功能*/
	@RequestMapping("/addRoleAction")
	public ModelAndView addaRole(RolePowerChoice rolepowerchoice,HttpSession session) {
		System.out.println("--------复选框勾选为"+rolepowerchoice.getPowernames());
		ModelAndView modelAndView;	
		boolean ret =roleservice.addRole(rolepowerchoice);
		if(rolepowerchoice.getPowernames()!=null){
		//根据名字查到一条角色所有数据（取角色id）
		RolePowerChoice role=roleservice.findonerole(rolepowerchoice);
		System.out.println("--------role"+role.getRole_id());
		rolepowerchoice.setRole_id(role.getRole_id());
		session.setAttribute("rolepowerchoice",rolepowerchoice);
			modelAndView=new ModelAndView("redirect:/addrolepowerids");
			}else{
				modelAndView=new ModelAndView("redirect:/rolesAction");
			}
		return modelAndView;
	}
	//修改查找roleid
	/* 先根据角色id找要修改的角色，再根据角色id查找所有功能id,最后找到功能id的name显示到修改页面*/
	@RequestMapping("/findRoleByIdAction")
	public ModelAndView findRoleByIdAction(Integer role_id,Integer flag,HttpSession session) {
		System.out.println("--------------------------------------role_id"+role_id);
		ModelAndView modelAndView;
		Role modifyrole=roleservice.findRoleById(role_id);
		modelAndView=new ModelAndView("forward:/findPoweridsByRoleId?role_id="+modifyrole.getRole_id());
		modelAndView.addObject("modifyrole",modifyrole) ;
		session.setAttribute("modifyrole",modifyrole);
		session.setAttribute("flag",flag);
		return modelAndView;
		}
	
	//修改
	@RequestMapping("/updateRoleAction")
	public ModelAndView updateRole(RolePowerChoice rolepowerchoice,HttpSession session) {
		ModelAndView modelAndView;
		//更新角色表
		boolean ret1 =roleservice.updateRole(rolepowerchoice);
		//删除角色原有功能
		boolean ret2=rolepowerservice.deleteRolepowerById(rolepowerchoice.getRole_id());
		//重新插入角色功能
		if(rolepowerchoice.getPowernames()!=null){
		int ret3=rolepowerservice.addRolePowerIds(rolepowerchoice);}
	modelAndView=new ModelAndView("redirect:/rolesAction");
		return modelAndView;
	}
	
	
	//删除角色，并删除用户角色表和角色功能表相关信息
	@RequestMapping("/deleteRoleByIdAction")
	public ModelAndView deleteRoleById(Integer role_id){
		ModelAndView modelAndView;	
		boolean ret1 = roleservice.deleteRoleById(role_id);//删除role
		boolean ret2=userroleservice.deleteuserroleByroleId(role_id);//删除userrole
		boolean ret3=rolepowerservice.deleteRolepowerById(role_id);//删除rolepower
		modelAndView=new ModelAndView("redirect:/rolesAction");//删除rolepower
		return modelAndView;
	}
	
	

}
