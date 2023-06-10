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
		} else if(dao.isDuplicatedId(id)){
			//아이디는 존재, 비밀번호가 틀린 경우.
			if(!dao.isEqauls(id, password)) {
				HttpSession session = request.getSession();
				session = request.getSession();
				session.setAttribute("loginFeedback", "비밀번호가 일치하지 않아요");
				System.out.println("재로그인. by LoginController");
				return "login.do";
			}
		} else {
			//아이디없고, 비번도 안맞겠지...
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("loginFeedback", "일치하는 회원이 없어요");
			System.out.println("재로그인. by LoginController");
		}
		return "login.do";
	}
	}
