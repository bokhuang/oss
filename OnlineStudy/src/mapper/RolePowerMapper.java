package mapper;

import java.util.List;

import domain.RolePower;

public interface RolePowerMapper {
  //根据role_id删除记录
	boolean deleteRolepowerById(Integer role_id);
	/* 增加角色，同时增加角色功能*/
	 boolean addRolePowerIds(RolePower rolepower);
	//根据角色id查所有功能id
	List<RolePower> findPowerList(Integer role_id);
	//根据power_id删除记录
	boolean deleterolepowerBypowerId(Integer power_id);
}