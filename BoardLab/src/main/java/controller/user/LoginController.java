package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;
import controller.Controller;

public class LoginController implements Controller {
//어? 이게 뭐지? 하는 친구들?
//핸들러맵핑 쪽에도 뭔가 추가해줘야함
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		
		UserDAO dao = new UserDAO();
		UserVO user = dao.getUser(vo); //검색을 해야함
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return "Ok.jsp";
		} else {
			return "login.html";
		}
	}
	
}