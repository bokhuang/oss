package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.CWareCourseChoice;
import domain.CourseWare;
import mapper.CourseWareMapper;

@Service
public class CourseWareService {
	@Autowired
	private CourseWareMapper coursewaremapper;
//根据课程id查看已被选择的课件
	public List<CourseWare> findcheckedCourseWares(Integer course_id) {
		return coursewaremapper.findcheckedCourseWares(course_id);
	}
	//删除课程时，同时删除课件deletecourseware 
	public boolean deletecourseware(Integer course_id) {
		return coursewaremapper.deletecourseware(course_id);
	}
	//查找所有课件
	public List<CWareCourseChoice> findCourseWares(CWareCourseChoice cwarecoursechoice) {
		return coursewaremapper.findCourseWares(cwarecoursechoice);
	}
	//增加课件
	public boolean addCourseWare(CourseWare courseware) {
		return coursewaremapper.addCourseWare(courseware);
	}
	//修改找id
	public CWareCourseChoice findCourseWareById(Integer courseware_id) {
		return coursewaremapper.findCourseWareById(courseware_id);
	}
	//修改
	public boolean updateCourseWare(CourseWare modifycourseware) {
		return coursewaremapper.updateCourseWare(modifycourseware);
	}
	//删除
	public boolean deleteCourseWare(Integer courseware_id) {
		return coursewaremapper.deleteCourseWare(courseware_id);
	}
	//根据课程id找课件
	public List<CourseWare> findOneCourseWares(Integer integer) {
		return coursewaremapper.findOneCourseWares(integer);
	}
	
}
