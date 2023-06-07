package controller.user2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;
import controller.all.Controller;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserVO login = new UserVO(id, password);

		UserDAO dao = new UserDAO();
		UserVO user = dao.login(login);

		String msg = "";
		String url = "";
		if (user != null) {
			request.setAttribute("loginUser", user);
			msg = "로그인 성공";
			url = "/MyLibrary/main.do";
		} else {
			msg = "아이디 또는 패스워드가 잘못되었습니다";
			url = "/MyLibrary/login.do";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/login/loginprocess.jsp";
	}

}
