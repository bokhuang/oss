package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Batch;
import domain.BatchRecorder;
import domain.CourseBatchChoice;
import mapper.BatchMapper;

@Service
public class BatchService {
	@Autowired
	private BatchMapper batchmapper;
//查找所有批次
	public List<CourseBatchChoice> findBatchs(CourseBatchChoice coursebatchchoice) {
		return batchmapper.findBatchs(coursebatchchoice);
	}
//增加批次
	public boolean addBatch(CourseBatchChoice coursebatchchoice) {
		return batchmapper.addBatch(coursebatchchoice);
	}
	//查找一条批次记录,根据batch_name
	public CourseBatchChoice findoneBatch(CourseBatchChoice coursebatchchoice) {
		return batchmapper.findoneBatch(coursebatchchoice);
	}
	//查找一条批次记录,根据batch_id
	public Batch findbatchbyBatchId(Integer batch_id) {
		return batchmapper.findbatchbyBatchId(batch_id);
	}
	//修改
	public boolean updateBatch(CourseBatchChoice coursebatchchoice) {
		return batchmapper.updateBatch(coursebatchchoice);
	}
	//删除
	public boolean deleteBatchById(Integer batch_id) {
		return batchmapper.deleteBatchById(batch_id);
	}
	//修改statement  
	public boolean updateStatement(CourseBatchChoice coursebatchchoice) {
		return batchmapper.updateStatement(coursebatchchoice);
	}
	//查找批次记录列表，看用户是否有学习记录
	public List<BatchRecorder> findRecord(BatchRecorder batchrecorder) {
		return batchmapper.findRecord(batchrecorder);
	}
	
	
}
