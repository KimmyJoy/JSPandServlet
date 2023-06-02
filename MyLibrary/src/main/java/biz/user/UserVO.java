package biz.user;

public class UserVO {

	//알슆s+c, o, r
		//유저정보를 위해 필요한 것 고유번호/id/pw/생년월일/전화번호/이메일주소
//		private  int seq;
		private String id;
		private String password;
		private String name;
		private String phonenum;
		private String email;
		private String role;
		
		public UserVO() {
			super();
		}
		
		public UserVO(String id) {
			super();
			this.id = id;
		}	
		
		
		public UserVO(String id, String password) {
			super();
			this.id = id;
			this.password = password;
		}

		public UserVO(String id, String password, String name, String phonenum, String email, String role) {
			super();
//			this.seq = seq;
			this.id = id;
			this.password = password;
			this.name = name;
			this.phonenum = phonenum;
			this.email = email;
			this.role = role;
		}


//		public int getSeq() {
//			return seq;
//		}
//		public void setSeq(int seq) {
//			this.seq = seq;
//		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
		public String getPhonenum() {
			return phonenum;
		}

		public void setPhonenum(String phonenum) {
			this.phonenum = phonenum;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		
		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		@Override
		public String toString() {
			return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", phonenum=" + phonenum + ", email=" + email + ", role=" + role + "]";
		}//스태틱으로 선언된 멤버변수를 소환하고 싶으면 '스태틱이들은클래스이름.변수'로 소환

		
	}

