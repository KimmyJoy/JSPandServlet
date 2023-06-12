package controller.user2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.lib.UserDAO;
import biz.user.lib.UserVO;
import controller.all.Controller;

public class InsertUserProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phonenum = request.getParameter("phonenum");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		
		if(role == null) {
			role = "U";
		}
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setName(name);
		vo.setPhonenum(phonenum);
		vo.setEmail(email);
		vo.setRole(role);
		
		UserDAO dao = new UserDAO();
		dao.insertUser(vo);
		//dao에 vo를 넘김
		
		return "/jsp/login.jsp";
	}
}
