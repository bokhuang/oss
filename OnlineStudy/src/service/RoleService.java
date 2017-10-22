package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Role;
import domain.RolePowerChoice;
import mapper.RoleMapper;

@Service
public class RoleService {
	@Autowired
	private RoleMapper roleMapper;
	//查找全部角色（可根据名字选择查询）
	public List<Role> execute(Role role) {
		List<Role> roles=roleMapper.findallroles(role);
		return roles;
	}
	//查找已经选择的角色
	public List<Role> modifyfindchecked(List<Integer> attribute) {
		List<Role> roles=roleMapper.modifyfindchecked(attribute);
		return roles;
	}
	//增加role
	public boolean addRole(RolePowerChoice rolepowerchoice) {
		boolean ret=roleMapper.addRole(rolepowerchoice);
		if(ret){
			return true;
		}else{
		return false;
		}
	}
	//根据角色名字查找一条记录
	public RolePowerChoice findonerole(RolePowerChoice rolepowerchoice) {
		return roleMapper.findonerole(rolepowerchoice);
		
	}
	//修改查找roleid
	public Role findRoleById(Integer role_id) {
		Role role=roleMapper.findRoleById(role_id);
		return role;
	}
	//修改
	public boolean updateRole(RolePowerChoice rolepowerchoice) {
		boolean ret=roleMapper.updateRole(rolepowerchoice);
		if(ret){
			return true;
		}else{
		return false;
		}
	}
	//删除
	public boolean deleteRoleById(Integer role_id) {
		boolean ret=roleMapper.deleteRoleById(role_id);
		if(ret){
			return true;
		}else{
		return false;
		}
	}
}
