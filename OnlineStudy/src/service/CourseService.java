package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.CWareCourseChoice;
import domain.Course;
import mapper.CourseMapper;

@Service
public class CourseService {
	@Autowired
	private CourseMapper coursemapper;
//查找所有课程信息
	public List<Course> findallcourses(Course course) {
		return coursemapper.findallcourses(course);
	}
	//增加课程
	public boolean addCourse(Course course) {
		return coursemapper.addCourse(course);
	}
	
	//修改查找id
	public Course findCourseById(Integer course_id) {
		return coursemapper.findCourseById(course_id);
	}
	//修改
	public boolean updateCourse(Course course) {
		return coursemapper.updateCourse(course);
	}
	//删除
	public boolean deleteCourseById(Integer course_id) {
		return coursemapper.deleteCourseById(course_id);
	}
	
}
