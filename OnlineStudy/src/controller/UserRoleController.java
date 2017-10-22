package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.Role;
import domain.User;
import domain.UserRole;
import domain.UserRoleChoice;
import service.UserRoleService;

@Controller
public class UserRoleController {
	@Autowired
	private UserRoleService userroleservice;
	/* 增加用户，同时增加用户角色*/
	@RequestMapping("/adduserroleids")
	public ModelAndView addUserRoleIds(HttpSession session) {
		ModelAndView modelAndView;
	int ret = userroleservice.addUserRoleIds((UserRoleChoice)session.getAttribute("userrolechoice"));
	System.out.println("一共插入了"+ret+"条记录");
		modelAndView=new ModelAndView("redirect:/userAction");
		return modelAndView;
	}

	/* 删除用户时，同时删除用户角色*/
	@RequestMapping("/deleteuserroleids")
		public String deleteUserRoleByUserId(Integer user_id) {
			boolean ret= userroleservice.deleteuserroleByuserId(user_id);
				return "forward:/userAction";
			
			}
		
	
	/* 删除角色时，同时删除用户角色*/
		@RequestMapping("/deleteroleid")
			public ModelAndView deleteuserroleByroleId(Integer role_id) {
			ModelAndView modelAndView;
				boolean ret= userroleservice.deleteuserroleByroleId(role_id);
				if(ret){
					modelAndView=new ModelAndView("redirect:/deleteroleidpower?role_id="+role_id);
				}else{
					modelAndView=null;
				}
				return modelAndView;
			}	

		/* 修改用户*/
		/* 先根据用户id找用户，再找所有角色id,最后找到该用户角色name显示到修改页面*/
	@RequestMapping("/findRoleidsByUserId")
	public ModelAndView findRoleidsByUserId(Integer user_id,HttpSession session) {
		ModelAndView modelAndView;
		List<UserRole> userroles= userroleservice.execute(user_id);
		System.out.println("----------------userroles"+userroles);
		Integer i=0;
		List<Integer> roleids=new ArrayList();
		Integer z=userroles.size();
		for(;i<z;i++){
			roleids.add(userroles.get(i).getRole_id());
		}
		System.out.println("----------------已选的roleids个数"+roleids.size());
		modelAndView=new ModelAndView("redirect:/modifyfindAllRoleNames");
		modelAndView.addObject("roleids", roleids) ;
		session.setAttribute("roleids", roleids);	
		return modelAndView;
		}
	
}
