package mapper;

import java.util.List;

import domain.CWareCourseChoice;
import domain.Course;

public interface CourseMapper {
    //查找所有课程
	List<Course> findallcourses(Course course);
	//增加课程
		boolean addCourse(Course course);
	//根据名字查id
	/*CWareCourseChoice findoneCourse(CWareCourseChoice cwarecoursechoice);*/
		
		//修改查找id
		Course findCourseById(Integer course_id);
		//修改
		boolean updateCourse(Course course);
		//删除
		boolean deleteCourseById(Integer course_id);
	
}