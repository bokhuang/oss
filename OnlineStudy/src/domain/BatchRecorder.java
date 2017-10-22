package domain;

public class BatchRecorder {
	 private Integer user_id;
	 private Integer batch_id;
	 private String batch_name;
	 private Integer recorder_id;
	    private Integer statement;
	    private Integer flag;
	    private Integer progress;
	    
	    public Integer getBatch_id() {
		return batch_id;
	}
	public void setBatch_id(Integer batch_id) {
		this.batch_id = batch_id;
	}
	public String getBatch_name() {
		return batch_name;
	}
	public void setBatch_name(String batch_name) {
		this.batch_name = batch_name;
	}
	public Integer getStatement() {
		return statement;
	}
	public void setStatement(Integer statement) {
		this.statement = statement;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public Integer getRecorder_id() {
		return recorder_id;
	}
	public void setRecorder_id(Integer recorder_id) {
		this.recorder_id = recorder_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getProgress() {
		return progress;
	}
	public void setProgress(Integer progress) {
		this.progress = progress;
	}

		
}
