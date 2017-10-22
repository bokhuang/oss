package domain;

import java.util.List;

public class CourseBatchChoice {
	 private Integer batch_id;

	    private String batch_name;

	    private Integer statement;
	    private List<Integer> coursenames;
	    
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

		public List<Integer> getCoursenames() {
			return coursenames;
		}

		public void setCoursenames(List<Integer> coursenames) {
			this.coursenames = coursenames;
		}
}
