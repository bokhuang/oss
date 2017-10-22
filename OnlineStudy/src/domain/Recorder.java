package domain;

public class Recorder {
    private Integer recorder_id;

    private Integer batch_id;

    private Integer user_id;

    private Integer progress;
    
    private Integer flag;
    
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

    public Integer getBatch_id() {
        return batch_id;
    }

    public void setBatch_id(Integer batch_id) {
        this.batch_id = batch_id;
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