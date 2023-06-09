package controller.user2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import controller.all.Controller;
import biz.user.lib.UserDAO;
import biz.user.lib.UserVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		System.out.println("id : " + id + ", password : "+password);

		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPassword(password);
		
		UserDAO dao = new UserDAO();
		UserVO user = null;
		//유효성 검사 필요
		if (dao.isEqauls(id, password)) {
			user = dao.getuserByid(id);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", user);
			System.out.println("나 되고 있니?");
			return "main.do";
		} else {
			System.out.println("응!");
			return "login.do";
		}
	}
}
