package mapper;

import java.util.ArrayList;
import java.util.List;

import domain.Batch;
import domain.BatchRecorder;
import domain.CourseBatchChoice;

public interface BatchMapper {
//查找所有批次
	List<CourseBatchChoice> findBatchs(CourseBatchChoice coursebatchchoice);
//增加批次
	boolean addBatch(CourseBatchChoice coursebatchchoice);
	//查找一条批次记录,根据batch_name
	CourseBatchChoice findoneBatch(CourseBatchChoice coursebatchchoice);
	//查找一条批次记录,根据batch_id
	Batch findbatchbyBatchId(Integer batch_id);
	//修改
	boolean updateBatch(CourseBatchChoice coursebatchchoice);
	//删除
	boolean deleteBatchById(Integer batch_id);
	//修改statement  
	boolean updateStatement(CourseBatchChoice coursebatchchoice);
	//查找批次记录列表，看用户是否有学习记录
	List<BatchRecorder> findRecord(BatchRecorder batchrecorder);
}