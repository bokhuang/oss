package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.User;
import domain.UserRoleChoice;
import mapper.UserMapper;
@Service
public class RegisterService {
	@Autowired
	private UserMapper userMapper;
	public int execute(UserRoleChoice u) {
		return userMapper.insert(u);
	}


}
