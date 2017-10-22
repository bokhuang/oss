package controller;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import domain.User;
import domain.UserRoleChoice;
import service.LoginService;
import service.UserRoleService;
import service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userservice;
	@Autowired
	private LoginService login;
	@Autowired
	private UserRoleService userroleservice;
	//查询用户列表，有参数则按参数查，没有则查全部
	@RequestMapping("/userAction")
	public ModelAndView findUsers(User user) {
		ModelAndView modelAndView;
		List<User> users=userservice.execute(user);
		System.out.println("--------------------------------------"+users);
		if(users!=null){
			modelAndView=new ModelAndView("forward:/manager/usermanager/UserQuery.jsp");
			modelAndView.addObject("users",users) ;
		}else{
			modelAndView=new ModelAndView("forward:/error.jsp");
		}
		return modelAndView;
	}
	

	/* 增加用户，同时增加用户角色*/
	/* 先增加，再查询该用户id传到用户角色表，循环加入页面勾选的角色*/
	@RequestMapping("/addUserAction")
	public ModelAndView addaUser(UserRoleChoice userrolechoice,HttpSession session) {
		System.out.println("--------复选框勾选为"+userrolechoice.getRolenames());
		ModelAndView modelAndView;	
		boolean ret =userservice.addUser(userrolechoice);
			if(userrolechoice.getRolenames()!=null){
		//login方法查到一条用户所有数据
		UserRoleChoice user=login.execute(userrolechoice);
		System.out.println("--------user"+user.getUser_id());
		userrolechoice.setUser_id(user.getUser_id());
		session.setAttribute("userrolechoice",userrolechoice);
			modelAndView=new ModelAndView("redirect:/adduserroleids");
			}else{
			modelAndView=new ModelAndView("redirect:/userAction");
		}
		return modelAndView;
	}
	/* 删除用户，同时删除用户角色*/
	@RequestMapping("/deleteUserByIdAction")
	public ModelAndView deleteUserById(Integer user_id) {
		ModelAndView modelAndView;
		User user=new User();
		user.setUser_id(user_id);
		boolean ret= userservice.deleteUserById(user);
		if(ret){
			modelAndView=new ModelAndView("redirect:/deleteuserroleids?user_id="+user.getUser_id());
			}else{
			return null;
			}
		return modelAndView;
	}
	/* 修改用户*/
	/* 先根据用户id找用户，再找所有角色id,最后找到该用户角色name显示到修改页面*/
	@RequestMapping("/findUserByIdAction")
	public ModelAndView findOneUserById(Integer user_id,Integer flag,HttpSession session) {
		ModelAndView modelAndView;
		User modifyuser= userservice.findOneUserById(user_id);
		System.out.println("---------------modifyuser.userid:"+modifyuser.getUser_id());
		if(modifyuser!=null){
			//找所有角色id
			modelAndView=new ModelAndView("redirect:/findRoleidsByUserId?user_id="+modifyuser.getUser_id());
			modelAndView.addObject("modifyuser",modifyuser);
			session.setAttribute("modifyuser", modifyuser);
			session.setAttribute("flag",flag);
		}else{
			modelAndView=null;
		}
		return modelAndView;
	}
	
	/* 修改用户*/
	@RequestMapping("/userUpdateAction")
	public ModelAndView updateUser(UserRoleChoice userrolechoice,HttpSession session) {
		ModelAndView modelAndView;
		//更新用户表
		boolean ret1 = userservice.updateUser(userrolechoice);
		//删除用户原有角色
		boolean ret2=userroleservice.deleteuserroleByuserId(userrolechoice.getUser_id());
		//重新插入用户角色
		if(userrolechoice.getRolenames()!=null){
		int ret3=userroleservice.addUserRoleIds(userrolechoice);}
	modelAndView=new ModelAndView("redirect:/userAction");
		return modelAndView;
	}
	
	
}
