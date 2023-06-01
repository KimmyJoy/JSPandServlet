package controller.all;

import java.util.HashMap;
import java.util.Map;

//import controller.user.InsertUserController;
//import controller.user.LoginController;

public class HandlerMapping {
	
	private Map<String, Controller> mappings;
	//여기에 쓰인 Controller는 우리가 인터페이스로 만든 컨트롤러임
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
//		mappings.put("/insertUser.do", new InsertUserController());
//		mappings.put("/login.do", new LoginController()); //해쉬 맵에 들어가는 key, 객체값
	}
	public Controller getController(String path) {
		return mappings.get(path);
		//나중에 클라이언트 측에서 요청이 들어올때 url로 요청이 들어올 것(ex login?id="ooo"&pw="oooo" 이런식) 그 로그인 값에 해당하는 것을 반환해주고 시행하게 하는 것
	}
}
