package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {

	//수행하고 응답하려는 jsp를 
	//로그인 컨트롤러 입장에서는 사용자가 넘겨준 아이디와 패스워드를 분석해서 해당하는 회원이 db에 있는지 없는지를 검색하여....
	//그 말인 즉슨 request와 response 객체가 필요해진다 그래서 파라미터가 아래와 같아야 함
	String handleRequest(HttpServletRequest request, HttpServletResponse response);
	//본래라면 이곳에 예외처리도 기입해야한다
	//어떤 컨트롤러 이건 같에 실제 작업을 수행하는 애들은 handlerequest라고 하겠다는 것임...
	//logout.do가 들어갔을때 어떤 컨트롤러를 불러야하는지를 알아야 함
	//아니면 배열이 필요해짐....
	
}
