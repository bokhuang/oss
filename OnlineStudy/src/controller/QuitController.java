package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.User;
import domain.UserRoleChoice;
import service.LoginService;
import service.UserService;

@Controller
public class QuitController {
	@Autowired
	private UserService userservice;
	//修改密码找旧密码
	@RequestMapping("/findModifyPwd")
	public ModelAndView findmodifypwd(HttpSession session) {
		ModelAndView modelAndView;
		Integer user_id=((UserRoleChoice)session.getAttribute("user")).getUser_id();
		User modifyuser= userservice.findOneUserById(user_id);
		System.out.println("++++++"+modifyuser.getPassword());
		modelAndView=new ModelAndView("forward:/common/modifyPassword.jsp");
		modelAndView.addObject("modifyuser",modifyuser) ;
		session.setAttribute("modifyuser",modifyuser);
		return  modelAndView;
	}
	//修改密码
	@RequestMapping("/modifyPwd")
	public ModelAndView modifypwd(User user) {
		ModelAndView modelAndView;
		boolean ret= userservice.modifypwd(user);
		if(ret){
			modelAndView=new ModelAndView("modifysuccess");
		}else{
			modelAndView=new ModelAndView("errorop");
		}
		return  modelAndView;
	}
	
	//退出登录
	@RequestMapping("/quitAction")
	public ModelAndView modifypwd(HttpSession session) {
		ModelAndView modelAndView;
		session.removeAttribute("user");
		modelAndView=new ModelAndView("forward:/Login/Login.jsp");
		return  modelAndView;
	}
}
