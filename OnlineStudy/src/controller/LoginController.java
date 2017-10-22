package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.User;
import domain.UserRoleChoice;
import service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService login;
	//根据用户名密码查找单条用户记录，然后根据用户id跳转到findpowers控制器，联合查询该用户拥有的功能列表
	@RequestMapping("/login")
	public ModelAndView checkUser(UserRoleChoice u,HttpSession session) {
		ModelAndView modelAndView;
		UserRoleChoice userrolechoice =login.execute(u);
		if(userrolechoice!=null){
		System.out.println("-------------用户id:"+userrolechoice.getUser_id());
		modelAndView=new ModelAndView("redirect:/findpowers?user_id="+userrolechoice.getUser_id());
		modelAndView.addObject("user",userrolechoice) ;
		session.setAttribute("user", userrolechoice);
		System.out.println((UserRoleChoice)session.getAttribute("user"));}else{
			modelAndView=new ModelAndView("error");
		}
		
		return modelAndView;
		}
		
	
	
}
