package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import domain.CWareCourseChoice;
import domain.Course;
import domain.CourseBatchChoice;
import domain.CourseWare;
import domain.Power;
import service.CourseService;
import service.CourseWareService;

@Controller
public class CourseWareController {
	@Autowired
	private   CourseWareService   coursewareservice;
	@Autowired
	private  CourseService  courseservice;
	//查看详细记录，包括课程信息和该课程拥有的课件信息
	@RequestMapping("/findcheckedAction")
	public ModelAndView findAllCourseWareAction(Integer course_id,HttpSession session) {
		ModelAndView modelAndView;
		List<CourseWare> coursewares=coursewareservice.findcheckedCourseWares(course_id);
		if(coursewares!=null){
			modelAndView=new ModelAndView("forward:/manager/coursemanager/ReadCourse.jsp");
			modelAndView.addObject("coursewares",coursewares) ;
			session.setAttribute("coursewares",coursewares);
		}else{
			modelAndView=new ModelAndView("forward:/error.jsp");
		}
		return modelAndView;
	}
	
	//查找所有课件
			@RequestMapping("/coursewaresAction")
			public ModelAndView findCourseWares(CWareCourseChoice cwarecoursechoice,HttpSession session) {
				ModelAndView modelAndView;
				List<CWareCourseChoice> coursewares=coursewareservice.findCourseWares(cwarecoursechoice);
				if(coursewares!=null){
					modelAndView=new ModelAndView("forward:/manager/coursewaremanager/CourseWareQuery.jsp");
					modelAndView.addObject("coursewares",coursewares) ;
					session.setAttribute("coursewares",coursewares);
				}else{
					modelAndView=new ModelAndView("forward:/errorop.jsp");
				}
				return modelAndView;
			}
	
	//（预查询）增加课件时，对课程的查询，供课件选择所属课程
			@RequestMapping("/addpreCourseAction")
			public ModelAndView findcoursesAction(Course course,HttpSession session) {
				ModelAndView modelAndView;
				List<Course> courses=courseservice.findallcourses(course);
					Map<Integer, String> coursesMap = new HashMap<Integer, String>();
					coursesMap.put(0, "");
					for (Course course1: courses) {
						coursesMap.put(course1.getCourse_id(),course1.getCourse_name());
						}
					modelAndView=new ModelAndView("forward:/manager/coursewaremanager/AddCourseWare.jsp");
				modelAndView.addObject("courses",coursesMap);
					return modelAndView;
				}

			//上传课件
			@RequestMapping("/addCourseWareAction")
			public ModelAndView addCourseWare(CourseWare courseware,MultipartFile file,HttpSession session) throws IOException{
				ModelAndView modelAndView;
				String filename=file.getOriginalFilename();
				System.out.println("------------------------file.getOriginalFilename();"+filename);
				String path = session.getServletContext().getRealPath("/")+"upload\\"+filename;
			    System.out.println("11111111111111111111"+path);
				File f=new File(path);
				file.transferTo(f);
				String uripath="/OnlineStudy/upload/"+filename;
				courseware.setUrl(uripath);
				boolean ret =coursewareservice.addCourseWare(courseware);
				if(ret){
					modelAndView=new ModelAndView("forward:/coursewaresAction");
				}else{
					modelAndView=new ModelAndView("forward:/errorop.jsp");
				}
				return modelAndView;
				
			}
			
			
			//修改找id
			@RequestMapping("/findCourseWareByIdAction")
			public ModelAndView findCourseWareById(Integer courseware_id,HttpSession session) {
				ModelAndView modelAndView;
				CWareCourseChoice modifycourseware=coursewareservice.findCourseWareById(courseware_id);
				List<Course> courses=courseservice.findallcourses(new Course());
				Map<Integer, String> coursesMap = new HashMap<Integer, String>();
				coursesMap.put(0, "");
				for (Course course1: courses) {
					coursesMap.put(course1.getCourse_id(),course1.getCourse_name());
					}
				if(modifycourseware!=null){
					modelAndView=new ModelAndView("forward:/manager/coursewaremanager/UpdateCourseWare.jsp");
					modelAndView.addObject("modifycourseware",modifycourseware) ;
					modelAndView.addObject("courses",coursesMap);
					session.setAttribute("modifycourseware",modifycourseware);
				}else{
					modelAndView=new ModelAndView("forward:/errorop.jsp");
				}
				return modelAndView;
			}
			
			//修改
			@RequestMapping("/updateCourseWareAction")
			public ModelAndView updateCourseWare(CourseWare modifycourseware,HttpSession session) {
				ModelAndView modelAndView;
				//更新课件表
				boolean ret1 = coursewareservice.updateCourseWare(modifycourseware);
				modelAndView=new ModelAndView("redirect:/coursewaresAction");
				return modelAndView;
			}
			
			//删除
			@RequestMapping("/deleteCourseWareByIdAction")
			public ModelAndView deleteCourseWare(Integer courseware_id,HttpSession session) {
				ModelAndView modelAndView;
				//更新课件表
				boolean ret= coursewareservice.deleteCourseWare(courseware_id);
				modelAndView=new ModelAndView("redirect:/coursewaresAction");
				return modelAndView;
			}
			
}
