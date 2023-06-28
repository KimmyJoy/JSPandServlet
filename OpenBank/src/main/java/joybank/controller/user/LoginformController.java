package joybank.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.user.UserDAO;
import biz.user.UserVO;
import joybank.controller.Controller;

public class LoginformController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		UserVO vo = new UserVO();
		vo.setU_id(id);
		vo.setU_pw(password);
		
		UserDAO dao = new UserDAO();
		UserVO user = dao.getUser(vo);
		System.out.println(user);
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return "/main.do";
			//위처럼 .do로 기재하면 로그인에서 로그인이 되면 controller에게 getBoardList라는 명령을 주는 것이 되고 GetBoardList.jsp를 실행하게 됨
		} else {
			return "/jsp/loginform.jsp";
		}
	}

}