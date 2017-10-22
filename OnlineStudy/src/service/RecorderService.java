package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.BatchRecorder;
import domain.CourseBatchChoice;
import domain.Recorder;
import domain.UserRoleChoice;
import mapper.RecorderMapper;

@Service
public class RecorderService {
	@Autowired
	private RecorderMapper  recordermapper;
	//申请，flag为1
	public boolean changeFlag(Integer recorder_id) {
		return recordermapper.changeFlag(recorder_id);
	}
	//撤销，flag为0
	public boolean updateFlag(Integer recorder_id) {
		return recordermapper.updateFlag(recorder_id);
	}
	//申请批次时插入所有批次记录信息
	public int insertrecord(List<CourseBatchChoice> batchsList,int user_id) {
		System.out.println("===============service=batchsList.size()"+batchsList.size());
		if(batchsList.size()>0){
			int i=0;
			for(;i<batchsList.size();i++){
			Recorder recorder=new Recorder();
			recorder.setBatch_id(batchsList.get(i).getBatch_id());
			recorder.setUser_id(user_id);
			recordermapper.insertrecord(recorder);
			}
			return i;
		}else{
			return 0;
			}
	}
	//学习记录查询 
	public List<BatchRecorder> checknote(Integer user_id) {
		return recordermapper.checknote(user_id);
	}
	//更新进度progress
	public boolean changeProgress(Recorder recorder) {
		return recordermapper.changeProgress(recorder);
	}
	
}
