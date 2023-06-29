package joybank.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.user.UserDAO;
import biz.user.UserVO;
import joybank.controller.Controller;

public class InsertUserController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("여기 통과하나요?");
		String id = request.getParameter("u_id");
		String password = request.getParameter("u_pw");
		String name = request.getParameter("u_nm");
		String phonenum = request.getParameter("u_num");
		String email = request.getParameter("u_email");
		String identy = request.getParameter("u_identy");
		String address = request.getParameter("address") + " " + request.getParameter("detailAddress");
		;
		
		
		// 유효성 검사: ID가 5자리의 영대소문자, 숫자로 이루어져 있는지 확인
//        if (!id.matches("^[a-zA-Z0-9]$")) {
//            request.setAttribute("error", "ID는 영대소문자 및 숫자를 포함해야 합니다.");
//            return "/jsp/error.jsp";
//        }
        // 유효성 검사: 비밀번호가 6자리 이상의 영대소문자 및 특수문자를 포함하고 있는지 확인
//        if (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$")) {
//            request.setAttribute("error", "비밀번호는 영대소문자, 숫자, 특수문자를 포함해 6자리 이상이어야 합니다.");
//            return "/jsp/error.jsp";
//        }
        // 유효성 검사: 이메일 형식 확인
//        if (!email.matches("\\b[\\w.%-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b")) {
//            // 에러 처리
//            request.setAttribute("error", "올바른 이메일 주소를 입력해 주세요.");
//            return "/jsp/error.jsp";
//        }
//        
        String role = request.getParameter("u_role");
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
			System.out.println(vo);
			//dao에 vo를 넘김
		} catch (Exception e) {
			e.printStackTrace();  // 혹은 적절한 로깅 또는 사용자에게 에러 메시지를 보여주는 등의 추가적인 처리를 수행
			return "/jsp/error.jsp";  // 에러 페이지로 이동
		}
		
		return "/jsp/index.jsp";
	}

	
}
