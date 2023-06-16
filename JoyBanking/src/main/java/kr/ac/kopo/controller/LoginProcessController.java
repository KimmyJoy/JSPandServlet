package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "로그인 성공");
		//		session.setAttrribute();

//		return "/jsp/login/loginProcess.jsp"; => 이건 forword를 시키는 것이고 나는 sendredirect를 하고 싶음 이 경우엔...
//		return request.getContextPath();//근데 이렇게 하는건 포워드 시키는 것임....
		return "redirect:" + request.getContextPath();//이게 올바른 리다이렉트 방법 앞에 "redirect"라는 키워드만 붙이면 됨
//		return "redirect:/MyBanking"; 이러한 표현 대신 위의 표현을 쓴것..
	}

}
