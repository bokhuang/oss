package domain;

import java.util.List;

public class UserRoleChoice {
	 private Integer user_id;
	    private String user_name;
	    private String password;
	    private String sex;
	    private String phone;
		private Integer userrole_id;
		
		 private List<Integer> rolenames;

	    public Integer getUser_id() {
	        return user_id;
	    }

	    public void setUser_id(Integer user_id) {
	        this.user_id = user_id;
	    }

	    public String getUser_name() {
	        return user_name;
	    }

	    public void setUser_name(String user_name) {
	        this.user_name = user_name == null ? null : user_name.trim();
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password == null ? null : password.trim();
	    }

	    public String getSex() {
	        return sex;
	    }

	    public void setSex(String sex) {
	        this.sex = sex == null ? null : sex.trim();
	    }

	    public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone == null ? null : phone.trim();
	    }

		public Integer getUserrole_id() {
			return userrole_id;
		}

		public void setUserrole_id(Integer userrole_id) {
			this.userrole_id = userrole_id;
		}

		public List<Integer> getRolenames() {
			return rolenames;
		}

		public void setRolenames(List<Integer> rolenames) {
			this.rolenames = rolenames;
		}

		

		
}
