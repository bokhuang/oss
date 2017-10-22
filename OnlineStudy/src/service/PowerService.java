package service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Power;
import domain.Role;
import mapper.PowerMapper;
import mapper.RoleMapper;

@Service
public class PowerService {
	@Autowired
	private PowerMapper powermapper;
	/*根据用户ID，查找菜单列表*/
	public List<Power> executeFindPowerList(int user_id){
		return powermapper.findPowerListByUserId(user_id);
		}
	//查找所有功能，可按条件查
	public List<Power> findPowers(Power power) {
		return powermapper.findPowers(power);
	}
	//增加功能
	public boolean addPower(Power power) {
		return powermapper.addPower(power);
	}
	//修改查id
	public Power findOnePowerById(Integer power_id) {
		return powermapper.findparentIdByPowerId(power_id);
	}
	//修改
	public boolean updatePower(Power power) {
		return powermapper.updatePower(power);
	}
	//删除
	public boolean deletePowerById(Integer power_id) {
		return powermapper.deletePowerById(power_id);
	}

}
