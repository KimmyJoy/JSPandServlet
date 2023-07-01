package joybank.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import joybank.controller.Controller;

public class AdminpagerController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		return "jsp/user/adminpage.jsp";
	}

}
