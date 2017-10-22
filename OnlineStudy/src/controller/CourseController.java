package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import domain.Course;
import service.CourseBatchService;
import service.CourseService;
import service.CourseWareService;
@Controller
public class CourseController {
	@Autowired
	private  CourseService  courseservice;
	@Autowired
	private CourseBatchService coursebatchservice;
	@Autowired
	private   CourseWareService   coursewareservice;
	//增加批次时，查找所有课程信息，供赋予批次课程
		@RequestMapping("/findAllCourses")
		public ModelAndView findallcourses(Course course,HttpSession session) {
			ModelAndView modelAndView;
			List<Course> courses=courseservice.findallcourses(course);
			modelAndView=new ModelAndView("forward:/manager/batchmanager/AddBatch.jsp");
			modelAndView.addObject("courses", courses) ;
			session.setAttribute("courses", courses);
			System.out.println("--------------------------------------"+courses);
			return modelAndView;
			}
		
		//修改查找id
		/* 先根据批次id找要修改的批次，再根据批次id查找所有已选课程id,最后找到所有课程id的name显示到修改页面*/
		@RequestMapping("/modifyfindAllCourseNames")
		public ModelAndView modifyfindAllCourseNames(HttpSession session) {
			ModelAndView modelAndView;
			Course nullcourse=new Course();
			List<Course> courses=courseservice.findallcourses(nullcourse);
			session.setAttribute("courses",courses);
			if(session.getAttribute("flag").equals(1)){
				modelAndView=new ModelAndView("forward:/manager/batchmanager/ReadBatch.jsp");
			}else{
				modelAndView=new ModelAndView("forward:/manager/batchmanager/UpdateBatch.jsp");
			}
			session.removeAttribute("flag");
			return modelAndView;
			}
		//查找所有课程
		@RequestMapping("/coursesAction")
		public ModelAndView findCourses(Course course,HttpSession session) {
			ModelAndView modelAndView;
			List<Course> courses=courseservice.findallcourses(course);
			if(courses!=null){
				modelAndView=new ModelAndView("forward:/manager/coursemanager/CourseQuery.jsp");
				modelAndView.addObject("courses",courses) ;
				session.setAttribute("courses", courses);
			}else{
				modelAndView=new ModelAndView("forward:/errorop.jsp");
			}
			return modelAndView;
		}
		
		//增加课程
		@RequestMapping("/addCourseAction")
		public ModelAndView addCourse(Course course) {
			ModelAndView modelAndView;
			boolean ret=courseservice.addCourse(course);
			if(ret){
				modelAndView=new ModelAndView("redirect:/coursesAction");
			}else{
				modelAndView=new ModelAndView("forward:/errorop.jsp");
			}
			return modelAndView;
		}
		
		//修改查找id
		@RequestMapping("/findCourseByIdAction")
		public ModelAndView findCourseById(Integer course_id) {
			ModelAndView modelAndView;
			Course modifycourse=courseservice.findCourseById(course_id);
				modelAndView=new ModelAndView("forward:/manager/coursemanager/UpdateCourse.jsp");
				modelAndView.addObject("modifycourse",modifycourse);
			return modelAndView;
		}
		//修改
		@RequestMapping("/updateCourseAction")
		public ModelAndView updateCourse(Course course,HttpSession session) {
			ModelAndView modelAndView;
			boolean ret=courseservice.updateCourse(course);
				modelAndView=new ModelAndView("redirect:/coursesAction");
			return modelAndView;
		}
		
	//删除，同时删除课程批次，删除对应课件
		@RequestMapping("/deleteCourseByIdAction")
		public ModelAndView deleteCourseById(Integer course_id){
			ModelAndView modelAndView;	
			boolean ret1 = courseservice.deleteCourseById(course_id);//删除course
			boolean ret2=coursebatchservice.deletecoursebatchBycourseId(course_id);//删除coursebatch
			boolean ret3=coursewareservice.deletecourseware(course_id);
			modelAndView=new ModelAndView("redirect:/coursesAction");
			return modelAndView;
		}
		//查看详细记录，包括课程信息和该课程拥有的课件信息
		@RequestMapping("/ReadCourseAction")
		public ModelAndView ReadCourse(Integer course_id,HttpSession session) {
			ModelAndView modelAndView;
			Course modifycourse=courseservice.findCourseById(course_id);
				modelAndView=new ModelAndView("redirect:/findcheckedAction?course_id="+course_id);
				modelAndView.addObject("modifycourse",modifycourse);
				session.setAttribute("modifycourse",modifycourse);
			return modelAndView;
		}
		
		
		
			
}