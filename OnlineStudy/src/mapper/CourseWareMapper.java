package mapper;

import java.util.List;

import domain.CWareCourseChoice;
import domain.CourseWare;

public interface CourseWareMapper {
	//根据课程id查看已被选择的课件
	List<CourseWare> findcheckedCourseWares(Integer course_id);
	//删除课程时，同时删除课件
	boolean deletecourseware(Integer course_id);
	//查找所有课件信息
	List<CWareCourseChoice> findCourseWares(CWareCourseChoice cwarecoursechoice);
	//增加课件
	boolean addCourseWare(CourseWare courseware);
	//修改找id
	CWareCourseChoice findCourseWareById(Integer courseware_id);
	//修改
	boolean updateCourseWare(CourseWare modifycourseware);
	//删除
	boolean deleteCourseWare(Integer courseware_id);
	//根据课程id找课件
	List<CourseWare> findOneCourseWares(Integer integer);
}