package ex10;

public class LoginBean {

	private String id;
	private String password;
	
	
	//게터 세터 필요(public으로 해줘야함) get/set이 jsp에서 getParameter할때 geter가 호출 setParameter할때 setter가 호출
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return password;
	}
	public void setPasswd(String password) {
		this.password = password;
	}
	
	public boolean dbCheck() {
		if(id.equals("hello") && password.equals("111")) {
			return true;
		} else {
			return false;
		}
	}
	
	
}
