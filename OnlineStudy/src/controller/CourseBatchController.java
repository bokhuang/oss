package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.CourseBatch;
import domain.CourseBatchChoice;
import domain.RolePower;
import service.CourseBatchService;

@Controller
public class CourseBatchController {
	@Autowired
	private CourseBatchService coursebatchservice;
	
	/* 增加批次，同时增加批次课程*/
	@RequestMapping("/addcoursebatchids")
	public ModelAndView addrolepowerids(HttpSession session) {
		ModelAndView modelAndView;
	int ret = coursebatchservice.addCourseBatchIds((CourseBatchChoice)session.getAttribute("coursebatchchoice"));
	System.out.println("一共插入了"+ret+"条记录");
		modelAndView=new ModelAndView("redirect:/batchsAction");
		return modelAndView;
	}
	
	//修改查找id
	/* 先根据批次id找要修改的批次，再根据批次id查找所有已选课程id,最后找到所有课程id的name显示到修改页面*/
		@RequestMapping("/findCourseidsByBatchId")
		public ModelAndView findCourseidsByBatchId(Integer batch_id,HttpSession session) {
			ModelAndView modelAndView;
			List<CourseBatch> coursebatchs=coursebatchservice.execute(batch_id);
			Integer i=0;
			List<Integer> courseids=new ArrayList();
			Integer z=coursebatchs.size();
			for(;i<z;i++){
				courseids.add(coursebatchs.get(i).getCourse_id());
			}
			System.out.println("----------------已选的courseids个数"+courseids.size());
			modelAndView=new ModelAndView("redirect:/modifyfindAllCourseNames");
			modelAndView.addObject("courseids",courseids) ;
			session.setAttribute("courseids",courseids);	
			return modelAndView;
			}
	
		
	
	
}
