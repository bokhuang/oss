package mapper;
import java.util.List;

import domain.BatchRecorder;
import domain.Recorder;

public interface RecorderMapper {
	
	//申请，flag为1
	boolean changeFlag(Integer recorder_id);
	//撤销，flag为0
	boolean updateFlag(Integer recorder_id);
	//申请批次时插入所有批次记录信息
	int insertrecord(Recorder recorder);
	//学习记录查询 
	List<BatchRecorder> checknote(Integer user_id);
	//更新进度progress
	boolean changeProgress(Recorder recorder);
	
}