package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

//		System.out.println("LogoutController handleRequest() 호출..");
		//1. dispatcherservlet이 받음 -> logout....을 알아냄
		//2. handler는 여기에 해당하는 url이 뭐야? 함
		return "/jsp/login/logout.jsp";
	}

}
