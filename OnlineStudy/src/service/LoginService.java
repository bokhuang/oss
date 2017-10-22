package service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.User;
import domain.UserRoleChoice;
import mapper.UserMapper;

@Service
public class LoginService {
	@Autowired
	private UserMapper userMapper;
	public UserRoleChoice execute(UserRoleChoice userrolechoice) {
		UserRoleChoice oneuser=userMapper.logincheckuser(userrolechoice);
		return oneuser;
	}


}
