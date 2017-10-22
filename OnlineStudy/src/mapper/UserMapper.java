package mapper;

import java.util.List;

import domain.User;
import domain.UserRoleChoice;

public interface UserMapper {
    //注册
    int insert(UserRoleChoice u);
    //登陆验证
    UserRoleChoice logincheckuser(UserRoleChoice userrolechoice);
    //查找用户列表
	List<User> findallusers(User user);
	//增加一个用户
	boolean addUser(UserRoleChoice userrolechoice);
	//删除用户
	boolean deleteUserById(User user);
	/* 先根据用户id找用户*/
	User findOneUserById(Integer user_id);
	/* 修改用户*/
	boolean updateUserById(UserRoleChoice userrolechoice);
	//修改密码
	boolean modifypwd(User user);
    
}