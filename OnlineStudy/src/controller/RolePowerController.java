package controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.RolePower;
import domain.RolePowerChoice;
import domain.UserRole;
import domain.UserRoleChoice;
import service.RolePowerService;


@Controller
public class RolePowerController {
	@Autowired
	private RolePowerService rolepowerservice;
//删除角色时，根据role_id删除角色功能相应记录
	@RequestMapping("/deleteroleidpower")
	public String deleteRolePowerById(Integer role_id) {
		boolean ret= rolepowerservice.deleteRolepowerById(role_id);
			return "forward:/rolesAction";
	}
	
	/* 增加角色，同时增加角色功能*/
	@RequestMapping("/addrolepowerids")
	public ModelAndView addrolepowerids(HttpSession session) {
		ModelAndView modelAndView;
	int ret = rolepowerservice.addRolePowerIds((RolePowerChoice)session.getAttribute("rolepowerchoice"));
	System.out.println("一共插入了"+ret+"条记录");
		modelAndView=new ModelAndView("redirect:/rolesAction");
		return modelAndView;
	}
	
	//修改查找roleid
	/* 先根据角色id找要修改的角色，再根据角色id查找所有功能id,最后找到功能id的name显示到修改页面*/
	@RequestMapping("/findPoweridsByRoleId")
	public ModelAndView findRoleidsByUserId(Integer role_id,HttpSession session) {
		ModelAndView modelAndView;
		List<RolePower> rolepowers=rolepowerservice.execute(role_id);
		System.out.println("----------------rolepowers"+rolepowers);
		Integer i=0;
		List<Integer> powerids=new ArrayList();
		Integer z=rolepowers.size();
		for(;i<z;i++){
			powerids.add(rolepowers.get(i).getPower_id());
		}
		System.out.println("----------------已选的powersids个数"+powerids.size());
		modelAndView=new ModelAndView("redirect:/modifyfindAllPowerNames");
		modelAndView.addObject("powerids",powerids) ;
		session.setAttribute("powerids",powerids);	
		return modelAndView;
		}
	
	

}
