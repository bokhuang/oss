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
import domain.CourseBatchChoice;
import domain.UserRoleChoice;
import service.BatchService;
import service.CourseBatchService;

@Controller
public class BatchController {
	@Autowired
	private BatchService batchservice;
	@Autowired
	private CourseBatchService coursebatchservice;
	//查询批次
	@RequestMapping("/batchsAction")
	public ModelAndView findBatchs(CourseBatchChoice coursebatchchoice,HttpSession session) {
		ModelAndView modelAndView;
		List<CourseBatchChoice> batchs=batchservice.findBatchs(coursebatchchoice);
		if(batchs!=null){
			modelAndView=new ModelAndView("forward:/manager/batchmanager/BatchQuery.jsp");
			modelAndView.addObject("batchs",batchs) ;
			session.setAttribute("batchs", batchs);
		}else{
			modelAndView=new ModelAndView("forward:/errorop.jsp");
		}
		return modelAndView;
	}
	
	/* 增加批次，同时增加批次课程*/
	/* 先增加，再查询该批次id传到课程批次表，循环加入页面勾选的课程*/
	@RequestMapping("/addBatchAction")
	public ModelAndView addaBatch(CourseBatchChoice coursebatchchoice,HttpSession session) {
		System.out.println("--------复选框勾选为"+coursebatchchoice.getCoursenames());
		ModelAndView modelAndView;	
		boolean ret =batchservice.addBatch(coursebatchchoice);
		if(coursebatchchoice.getCoursenames()!=null){
		//根据名字查到一条批次所有数据（取批次id）
		CourseBatchChoice batch=batchservice.findoneBatch(coursebatchchoice);
		coursebatchchoice.setBatch_id(batch.getBatch_id());
		session.setAttribute("coursebatchchoice",coursebatchchoice);
			modelAndView=new ModelAndView("redirect:/addcoursebatchids");
			}else{
				modelAndView=new ModelAndView("redirect:/batchsAction");
			}
		return modelAndView;
	}
	
	//修改查找id
	/* 先根据批次id找要修改的批次，再根据批次id查找所有已选课程id,最后找到所有课程id的name显示到修改页面*/
		@RequestMapping("/findBatchByIdAction")
		public ModelAndView findBatchByIdAction(Integer batch_id,Integer flag,HttpSession session) {
			ModelAndView modelAndView;
			System.out.println("--------flagflagflag"+flag);
			Batch modifybatch=batchservice.findbatchbyBatchId(batch_id);
			modelAndView=new ModelAndView("forward:/findCourseidsByBatchId?batch_id="+modifybatch.getBatch_id());
			modelAndView.addObject("modifybatch",modifybatch) ;
			session.setAttribute("modifybatch",modifybatch);
			session.setAttribute("flag",flag);
			return modelAndView;
			}
		//修改
		@RequestMapping("/updateBatchAction")
		public ModelAndView updateBatch(CourseBatchChoice coursebatchchoice,HttpSession session) {
			ModelAndView modelAndView;
			//更新批次表
			boolean ret1 =batchservice.updateBatch(coursebatchchoice);
			//删除批次原有课程
			boolean ret2=coursebatchservice.deleteCourseBatchById(coursebatchchoice.getBatch_id());
			//重新插入批次课程
			if(coursebatchchoice.getCoursenames()!=null){
			int ret3=coursebatchservice.addCourseBatchIds(coursebatchchoice);}
		modelAndView=new ModelAndView("redirect:/batchsAction");
			return modelAndView;
		}
		
		//修改statement   
		@RequestMapping("/updateStatementAction")
		public ModelAndView updateStatement(CourseBatchChoice coursebatchchoice,HttpSession session) {
			ModelAndView modelAndView;
			//更新批次表
			boolean ret1 =batchservice.updateStatement(coursebatchchoice);
			modelAndView=new ModelAndView("redirect:/batchsAction");
			return modelAndView;
		}
		
		
		//删除
		@RequestMapping("/deleteBatchByIdAction")
		public ModelAndView deleteBatchById(Integer batch_id) {
			ModelAndView modelAndView;
			boolean ret= batchservice.deleteBatchById(batch_id);
			boolean ret2=coursebatchservice.deleteCourseBatchById(batch_id);
			modelAndView=new ModelAndView("redirect:/batchsAction");
			return modelAndView;
		}
		
	
		//查找批次记录列表，看用户是否有学习记录
		@RequestMapping("/findRecord")
		public ModelAndView findRecord(BatchRecorder batchrecorder,HttpSession session) {
			ModelAndView modelAndView;
			batchrecorder.setUser_id(((UserRoleChoice)session.getAttribute("user")).getUser_id());
			List<BatchRecorder> batchs=batchservice.findRecord(batchrecorder);
			System.out.println("gaoahkfhakfk-------------------111-"+batchs.size());
			if(batchs.size()>0){
				modelAndView=new ModelAndView("forward:/manager/studymanager/batchStudy.jsp");
				modelAndView.addObject("batchs",batchs) ;
				session.setAttribute("batchs", batchs);
			}else if(batchs.size()==0){
				modelAndView=new ModelAndView("forward:/insertrecordAction");
			}else{
				modelAndView=new ModelAndView("errorop");}
			return modelAndView;
		}

		
}
