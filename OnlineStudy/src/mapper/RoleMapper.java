package mapper;

import java.util.List;

import domain.Role;
import domain.RolePowerChoice;

public interface RoleMapper {
//查找所有角色
	List<Role> findallroles(Role role);
//查找已经选择的角色
	List<Role> modifyfindchecked(List<Integer> attribute);
//增加角色
	boolean addRole(RolePowerChoice rolepowerchoice);
//修改查找roleid
	Role findRoleById(Integer role_id);
//修改
	boolean updateRole(RolePowerChoice rolepowerchoice);
//删除
	boolean deleteRoleById(Integer role_id);
	//查询一条记录（取出id）
	RolePowerChoice findonerole(RolePowerChoice rolepowerchoice);

}