package biz.user;

public class UserVO {

	private String u_id;
	private String u_pw;
	private String u_nm;
	private String u_num;
	private String u_identy;
	private String u_email;
	private String u_add;
	private String sys_join;
	private String u_stat;
	private int u_role;
	
	public UserVO() {
    }
	
	
	public UserVO(String u_id, String u_pw, String u_nm, String u_num, String u_identy, String u_email,
			String u_add, String sys_join, String u_stat, int u_role) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_nm = u_nm;
		this.u_num = u_num;
		this.u_identy = u_identy;
		this.u_email = u_email;
		this.u_add = u_add;
		this.sys_join = sys_join;
		this.u_stat = u_stat;
		this.u_role = u_role;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getU_pw() {
		return u_pw;
	}


	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}


	public String getU_nm() {
		return u_nm;
	}


	public void setU_nm(String u_nm) {
		this.u_nm = u_nm;
	}


	public String getU_num() {
		return u_num;
	}


	public void setU_num(String u_num) {
		this.u_num = u_num;
	}


	public String getU_identy() {
		return u_identy;
	}


	public void setU_identy(String u_identy) {
		this.u_identy = u_identy;
	}


	public String getU_email() {
		return u_email;
	}


	public void setU_email(String u_email) {
		this.u_email = u_email;
	}


	public String getU_add() {
		return u_add;
	}


	public void setU_add(String u_add) {
		this.u_add = u_add;
	}


	public String getU_sysjoin() {
		return sys_join;
	}


	public void setU_sysjoin(String sys_join) {
		this.sys_join = sys_join;
	}


	public String getU_stat() {
		return u_stat;
	}


	public void setU_stat(String u_stat) {
		this.u_stat = u_stat;
	}



	public int getU_role() {
		return u_role;
	}


	public void setU_role(int u_role) {
		this.u_role = u_role;
	}


	@Override
	public String toString() {
		return "UserVO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_nm=" + u_nm + ", u_num=" + u_num
				+ ", u_identy=" + u_identy + ", u_email=" + u_email + ", u_add=" + u_add + ", sys_join="
				+ sys_join + ", u_stat=" + u_stat + ", u_role=" + u_role + "]";
	}
	
}
