package controller.user2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.lib.UserDAO;
import biz.user.lib.UserVO;
import controller.all.Controller;

public class InsertUserController implements Controller {

	@Override
	//순서가 중요함
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	
		return "./jsp/user/insertuser.jsp";
		
	}

}
