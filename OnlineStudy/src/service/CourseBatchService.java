package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import domain.CourseBatch;
import domain.CourseBatchChoice;
import domain.RolePower;
import mapper.CourseBatchMapper;

@Service
public class CourseBatchService {
	@Autowired
	private CourseBatchMapper coursebatchmapper;
	/* 增加批次，同时增加批次课程*/
	public int addCourseBatchIds(CourseBatchChoice attribute) {
		Integer z=attribute.getCoursenames().size();
		int i=0;
		for(;i<z;i++){
			CourseBatch coursebatch=new CourseBatch();
			coursebatch.setCourse_id(attribute.getCoursenames().get(i));
			coursebatch.setBatch_id(attribute.getBatch_id());
			coursebatchmapper.addCourseBatchIds(coursebatch);
		}
		return i;
	}
	//根据批次id查所有课程id
	public List<CourseBatch> execute(Integer batch_id) {
		return coursebatchmapper.findCourseList(batch_id);
	}
	//根据batch_id删除批次课程表信息
	public boolean deleteCourseBatchById(Integer batch_id) {
		return coursebatchmapper.deleteCourseBatchById(batch_id);
	}
	//根据course_id删除批次课程表信息
	public boolean deletecoursebatchBycourseId(Integer course_id) {
		return coursebatchmapper.deletecoursebatchBycourseId(course_id);
	}
	
}
