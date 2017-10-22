package controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import domain.User;
import domain.UserRoleChoice;
import service.LoginService;
import service.RegisterService;
import service.UserRoleService;

@Controller
public class RegisterController {
	@Autowired
	private RegisterService register;
	@Autowired
	private LoginService login;
	@Autowired
	private UserRoleService userroleservice;
	@RequestMapping("/reg")
	public String checkUser(UserRoleChoice u) {
		int ret= register.execute(u);
		UserRoleChoice user=login.execute(u);
		u.setUser_id(user.getUser_id());
		int ret2 = userroleservice.addUserRoleIds(u);
		if (ret2>0) {
			//注册成功跳转到登陆界面
			return "forward:/Login/Login.jsp";
		}else {
			return "forward:/Register/Register_failure.jsp";
		}
			
		}


}
