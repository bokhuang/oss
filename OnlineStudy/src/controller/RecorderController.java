package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.Batch;
import domain.BatchRecorder;
import domain.CWareCourseChoice;
import domain.Course;
import domain.CourseBatch;
import domain.CourseBatchChoice;
import domain.CourseWare;
import domain.Power;
import domain.Recorder;
import domain.UserRoleChoice;
import service.BatchService;
import service.CourseBatchService;
import service.CourseService;
import service.CourseWareService;
import service.RecorderService;

@Controller
public class RecorderController {
	@Autowired
	private   CourseWareService   coursewareservice;
	@Autowired
	private RecorderService recorderservice;
	@Autowired
	private BatchService batchservice;
	@Autowired
	private CourseBatchService coursebatchservice;
	@Autowired
	private  CourseService  courseservice;
	//申请，flag为1
	@RequestMapping("/changeFlag")
	public void changeFlag(Integer recorder_id) {
		ModelAndView modelAndView;
		boolean ret1 =recorderservice.changeFlag(recorder_id);	
	}
	
	//撤销，flag为0
	@RequestMapping("/updateFlag")
	public ModelAndView updateFlag(Integer recorder_id) {
		ModelAndView modelAndView;
		boolean ret =recorderservice.updateFlag(recorder_id);
		modelAndView=new ModelAndView("redirect:/findRecord");
		return modelAndView;
	}
	//申请批次时插入所有批次记录信息
	@RequestMapping("/insertrecordAction")
	public ModelAndView insertrecord(HttpSession session) {
		List<CourseBatchChoice> batchsList=batchservice.findBatchs(new CourseBatchChoice());
		System.out.println("============22222batchsList.size()"+batchsList.size());
		ModelAndView modelAndView;
		int user_id=((UserRoleChoice)session.getAttribute("user")).getUser_id();
		System.out.println("============22222getUser_id()"+user_id);
		int ret=recorderservice.insertrecord(batchsList,user_id);
		modelAndView=new ModelAndView("redirect:/findRecord");
		return modelAndView;
	}
	//申请批次时，查询批次课程课件详情
	@RequestMapping("/findBatchDetailRead")
	public ModelAndView findBatchDetailRead(Integer batch_id,String batch_name,Integer flag,HttpSession session) {
		ModelAndView modelAndView;
		//找到批次名称
		session.setAttribute("batch_id",batch_id);
		session.setAttribute("batch_name",batch_name);
		//找到当前批次有的课程id
		List<CourseBatch> coursebatchs=coursebatchservice.execute(batch_id);
		System.out.println("------------------------根据批次id找课程id1为2"+coursebatchs.size());
		if(coursebatchs.size()>0){
		Integer i=0;
		List<Integer> courseids=new ArrayList();
		Integer z=coursebatchs.size();
		for(;i<z;i++){
			courseids.add(coursebatchs.get(i).getCourse_id());
		}
		System.out.println("=============课程id为courseids,1,2"+courseids);
		//根据课程id查找所有课程
		List<Course> coursesList=new ArrayList<Course>();
			for(int j=0;j<courseids.size();j++){
				Course course=new Course();
				course=courseservice.findCourseById(courseids.get(j));
				coursesList.add(course);
				}
			session.setAttribute("coursesList",coursesList);
			System.out.println("=========课程数为："+coursesList.size());

		//根据课程id找课件
		List<CourseWare> coursewaresList=new ArrayList<CourseWare>();
		if(courseids.size()>0){
		for(int k=0;k<courseids.size();k++){
			List<CourseWare> coursewares=coursewareservice.findOneCourseWares(courseids.get(k));
			System.out.println("=====================coursewares2"+coursewares.size());
			if(coursewares.size()>0){
				for(int s=0;s<coursewares.size();s++){
					coursewaresList.add(coursewares.get(s));
				}
			}
			coursewares.clear();	
			System.out.println("+++++++++++++++coursewaresList.size()"+coursewaresList.size());
		}}
		session.setAttribute("coursewaresList",coursewaresList);
		if(flag==0){
			modelAndView=new ModelAndView("forward:/manager/studymanager/batchDetailRead.jsp");
		}else if(flag==1){
			modelAndView=new ModelAndView("forward:/manager/studymanager/study.jsp");
		}else{
			modelAndView=new ModelAndView("errorop");
		}
	}else{
		modelAndView=new ModelAndView("errorop");
	}
		return modelAndView;
		}
	
	//学习记录查询 
	@RequestMapping("/checknote")
	public ModelAndView checknote(HttpSession session) {
		ModelAndView modelAndView;
		Integer user_id=((UserRoleChoice)session.getAttribute("user")).getUser_id();
		List<BatchRecorder> BatchRecorderList=recorderservice.checknote(user_id);
		System.out.println("+++++++++++++"+BatchRecorderList.size());
		modelAndView=new ModelAndView("forward:/manager/studymanager/noteBook.jsp");
		modelAndView.addObject("BatchRecorderList",BatchRecorderList) ;
		return modelAndView;
	}
	//更新进度progress
	@RequestMapping("/changeProgress")
	public ModelAndView changeProgress(Integer progress,HttpSession session) {
		ModelAndView modelAndView;
		Integer user_id=((UserRoleChoice)session.getAttribute("user")).getUser_id();
		Recorder recorder=new Recorder ();
		recorder.setUser_id(user_id);
		recorder.setBatch_id((Integer)session.getAttribute("batch_id"));
		recorder.setProgress(progress);
		boolean ret=recorderservice.changeProgress(recorder);
		modelAndView=new ModelAndView("redirect:/checknote");
		return modelAndView;
		
	}
	
}
