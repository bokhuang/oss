package mapper;

import java.util.List;

import domain.Power;

public interface PowerMapper {
	//根据用户id联合查询到所有power
	List<Power> findPowerListByUserId(int userId);
//查找不重复power的父結點（查找单条记录）
	Power findparentIdByPowerId(Integer integer);
//查找所有功能信息
	List<Power> findPowers(Power power);
	//增加功能
	boolean addPower(Power power);
	//修改
	boolean updatePower(Power power);
	//删除
	boolean deletePowerById(Integer power_id);
}