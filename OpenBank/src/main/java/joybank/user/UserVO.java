package joybank.user;

public class UserVO {

	private String u_cd;
	private String u_id;
	private String u_pw;
	private String u_nm;
	private String u_num;
	private String u_identy;
	private String u_email;
	private String u_address;
	private String u_sysjoin;
	private String u_birth;
	private int role_cd;
	
	
	public UserVO(String u_cd, String u_id, String u_pw, String u_nm, String u_num, String u_identy, String u_email,
			String u_address, String u_sysjoin, String u_birth, int role_cd) {
		super();
		this.u_cd = u_cd;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_nm = u_nm;
		this.u_num = u_num;
		this.u_identy = u_identy;
		this.u_email = u_email;
		this.u_address = u_address;
		this.u_sysjoin = u_sysjoin;
		this.u_birth = u_birth;
		this.role_cd = role_cd;
	}


	public String getU_cd() {
		return u_cd;
	}


	public void setU_cd(String u_cd) {
		this.u_cd = u_cd;
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


	public String getU_address() {
		return u_address;
	}


	public void setU_address(String u_address) {
		this.u_address = u_address;
	}


	public String getU_sysjoin() {
		return u_sysjoin;
	}


	public void setU_sysjoin(String u_sysjoin) {
		this.u_sysjoin = u_sysjoin;
	}


	public String getU_birth() {
		return u_birth;
	}


	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}



	public int getRole_cd() {
		return role_cd;
	}


	public void setRole_cd(int role_cd) {
		this.role_cd = role_cd;
	}


	@Override
	public String toString() {
		return "UserVO [u_cd=" + u_cd + ", u_id=" + u_id + ", u_pw=" + u_pw + ", u_nm=" + u_nm + ", u_num=" + u_num
				+ ", u_identy=" + u_identy + ", u_email=" + u_email + ", u_address=" + u_address + ", u_sysjoin="
				+ u_sysjoin + ", u_birth=" + u_birth + ", role_cd=" + role_cd + "]";
	}
	
	
}
