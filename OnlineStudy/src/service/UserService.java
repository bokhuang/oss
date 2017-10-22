package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.User;
import domain.UserRoleChoice;
import mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	//查找用户列表
	private UserMapper userMapper;
	public List<User> execute(User user) {
		List<User> users=userMapper.findallusers(user);
		return users;
	}
	//管理员增加用户
	public boolean addUser(UserRoleChoice userrolechoice) {
		boolean ret=userMapper.addUser(userrolechoice);
		if(ret){
		return true;
		}else{
		return false;
		}
	}
	//删除用户
	public boolean deleteUserById(User user) {
		System.out.println("---------------第二个user对象"+user);
		boolean ret=userMapper.deleteUserById(user);
		System.out.println("---------------完成:"+user.getUser_id());
		if(ret){
			return true;
			}else{
			return false;
			}
	}
	/* 先根据用户id找用户*/
	public User findOneUserById(Integer user_id) {
		User user=userMapper.findOneUserById(user_id);
		return user;
	}
	
	/* 修改用户*/
	public boolean updateUser(UserRoleChoice userrolechoice) {
		boolean ret=userMapper.updateUserById(userrolechoice);
		return ret;
	}
	//修改密码
	public boolean modifypwd(User user) {
		boolean ret=userMapper.modifypwd(user);
		return ret;
	}
	
	
}
