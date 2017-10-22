package mapper;

import java.util.List;
import domain.UserRole;

public interface UserRoleMapper {
	
	//查找该所有角色id
	 List<UserRole> findRoleList(Integer user_id);
	 /* 增加用户，同时增加用户角色*/
	 boolean addUserRoleIds(UserRole attribute);
	//根据user_id删除一条或多条记录
	boolean deleteuserroleByuserId(Integer user_id);
	//根据role_id删除一条或多条记录
	boolean deleteuserroleByroleId(Integer role_id);
}
