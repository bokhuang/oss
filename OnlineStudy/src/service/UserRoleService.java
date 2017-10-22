package service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import domain.Role;
import domain.UserRole;
import domain.UserRoleChoice;
import mapper.UserRoleMapper;

@Service
public class UserRoleService {
	@Autowired
	private UserRoleMapper userrolemapper;
	/* 先根据用户id找所有角色id*/
	public List<UserRole> execute(Integer user_id){
		List<UserRole> userroles=new ArrayList<UserRole>();
		userroles=userrolemapper.findRoleList(user_id);
		return userroles;
	}
	/* 增加用户，同时增加用户角色*/
	public int addUserRoleIds(UserRoleChoice userrolechoice) {
		Integer z=userrolechoice.getRolenames().size();
		System.out.println("----------------zzzzzzzz"+z);
		int i=0;
		for(;i<z;i++){
			UserRole userrole=new UserRole();
			userrole.setRole_id(userrolechoice.getRolenames().get(i));
			userrole.setUser_id(userrolechoice.getUser_id());
			userrolemapper.addUserRoleIds(userrole);
			System.out.println("----------------赋值赋值userroles"+userrole.getRole_id());
		}
		userrolechoice.getRolenames().clear();
		return i;	
		
	}
	//根据user_id删除一条或多条记录
	public boolean deleteuserroleByuserId(Integer user_id) {
		boolean ret=userrolemapper.deleteuserroleByuserId(user_id);
		if(ret){
			ret=true;
		}else{
			ret=false;
		}
		return ret;
	}
	//根据role_id删除一条或多条记录
	public boolean deleteuserroleByroleId(Integer role_id) {
		boolean ret=userrolemapper.deleteuserroleByroleId(role_id);
		System.out.println("----------------------------------数据库一步role"+ret);
		if(ret){
			ret=true;
		}else{
			ret=false;
		}
		return ret;
	}
	
	
	
	
}
