package domain;

import java.util.List;

public class RolePowerChoice {
	  private Integer role_id;
	    private String role_name;
	    private Integer rp_id;
	    private List<Integer> powernames;
		public Integer getRole_id() {
			return role_id;
		}
		public void setRole_id(Integer role_id) {
			this.role_id = role_id;
		}
		public String getRole_name() {
			return role_name;
		}
		public void setRole_name(String role_name) {
			this.role_name = role_name;
		}
		public Integer getRp_id() {
			return rp_id;
		}
		public void setRp_id(Integer rp_id) {
			this.rp_id = rp_id;
		}
		public List<Integer> getPowernames() {
			return powernames;
		}
		public void setPowernames(List<Integer> powernames) {
			this.powernames = powernames;
		}
	    
	    
	    
	    
}
