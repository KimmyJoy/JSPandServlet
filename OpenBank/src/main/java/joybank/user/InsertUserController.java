package joybank.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import joybank.controller.Controller;

public class InsertUserController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phonenum = request.getParameter("phonenum");
		String email = request.getParameter("email");
		String identy = request.getParameter("identy");
		String address = request.getParameter("address");
		String role = request.getParameter("role");
		
		//회원은 선택이 불가능하기 때문에 하단처럼 null일때 자동입력해주는 것이 필요
		if(role == null) {
			role = "1";
		}
		
		UserVO vo = new UserVO();
		vo.setU_id(id);
		vo.setU_pw(password);
		vo.setU_nm(name);
		vo.setU_num(phonenum);
		vo.setU_email(email);
		vo.setU_identy(identy);
		vo.setU_add(address);
		vo.setU_role(Integer.parseInt(role));
		
		UserDAO dao = new UserDAO();
		try {
			dao.insertUser(vo);
			//dao에 vo를 넘김
		} catch (Exception e) {
			e.printStackTrace();  // 혹은 적절한 로깅 또는 사용자에게 에러 메시지를 보여주는 등의 추가적인 처리를 수행
			return "/jsp/error.jsp";  // 에러 페이지로 이동
		}
		
		return "/jsp/index.jsp";
	}

	
	
}
