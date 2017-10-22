package mapper;

import java.util.List;

import domain.CourseBatch;

public interface CourseBatchMapper {
	/* 增加批次，同时增加批次课程*/
	void addCourseBatchIds(CourseBatch coursebatch);
    //根据批次id查所有课程id
	List<CourseBatch> findCourseList(Integer batch_id);
	//根据batch_id删除批次课程表信息
	boolean deleteCourseBatchById(Integer batch_id);
	//根据course_id删除批次课程表信息
	boolean deletecoursebatchBycourseId(Integer course_id);

}