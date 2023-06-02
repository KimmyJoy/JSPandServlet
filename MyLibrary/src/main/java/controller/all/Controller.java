package controller.all;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
//인터페이스로 만들어놓고 상속받아서 쓰게 하기 위해 interface로 만듬
	//인터페이스로 해야 추상함수 만들때 에러가 나지 않는다
	String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
