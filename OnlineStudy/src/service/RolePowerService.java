package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import domain.RolePower;
import domain.RolePowerChoice;
import mapper.RolePowerMapper;


@Service
public class RolePowerService {
	@Autowired
	private RolePowerMapper rolepowermapper;
	//根据role_id删除记录
	public boolean deleteRolepowerById(Integer role_id) {
		boolean ret=rolepowermapper.deleteRolepowerById(role_id);
		if(ret){
			ret=true;
		}else{
			ret=false;
		}
		return ret;
	}
	/* 增加角色，同时增加角色功能*/
	public int addRolePowerIds(RolePowerChoice attribute) {
		Integer z=attribute.getPowernames().size();
		int i=0;
		for(;i<z;i++){
			RolePower rolepower=new RolePower();
			rolepower.setPower_id(attribute.getPowernames().get(i));
			rolepower.setRole_id(attribute.getRole_id());
			rolepowermapper.addRolePowerIds(rolepower);
		}
		return i;
	}
	//根据角色id查所有功能id
	public List<RolePower> execute(Integer role_id) {
		return rolepowermapper.findPowerList(role_id);
	}
	//根据power_id删除记录
	public boolean deleterolepowerBypowerId(Integer power_id) {
		boolean ret=rolepowermapper.deleterolepowerBypowerId(power_id);
		if(ret){
			ret=true;
		}else{
			ret=false;
		}
		return ret;
	}
}
