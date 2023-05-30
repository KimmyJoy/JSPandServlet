package controller;

import java.util.HashMap;
import java.util.Map;

public class HandlerMapping {
	
	private Map<String, Controller> mappings;
	//여기에 쓰인 Controller는 우리가 인터페이스로 만든 컨트롤러임
	public HandlerMapping() {
		mappings = new HashMap<String, Controller>();
	}
	public Controller getController(String path) {
		return mappings.get(path);
		//나중에 클라이언트 측에서 요청이 들어올때 url로 요청이 들어올 것(ex login?id="ooo"&pw="oooo" 이런식) 그 로그인 값에 해당하는 것을 반환해주고 시행하게 하는 것
	}
}
