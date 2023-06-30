package joybank.controller.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import biz.user.UserDAO;
import biz.user.UserVO;
import joybank.controller.Controller;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	    response.setContentType("application/json");
	    PrintWriter out = null;

	    try {
	        out = response.getWriter();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }

	    JSONObject jsonObject = new JSONObject();

	    try {
	        String id = request.getParameter("id");
	        String password = request.getParameter("password");
	        UserVO vo = new UserVO();
	        vo.setU_id(id);
	        vo.setU_pw(password);
	        
	        UserDAO dao = new UserDAO();
	        UserVO user = dao.getUser(vo);
	        System.out.println(user);
	        
	        if(user != null && dao.isEqauls(id, password)) {  // 추가: isEquals 메소드를 호출하여 ID와 비밀번호가 일치하는지 확인
	        	HttpSession session = request.getSession();
	        	session.setAttribute("loginUser", user);
	        	  System.out.println("Adding success to JSON");
	              jsonObject.put("success", true);
	              System.out.println("Success added to JSON");
	        } else {
	            jsonObject.put("success", false);
	            jsonObject.put("message", "아이디 혹은 비밀번호가 잘못되었습니다.");
	            System.out.println("json 되고 있니");
	        }
	    } catch (Exception e) {
	        try {
				jsonObject.put("success", false);
				jsonObject.put("message", "에러 발생: " + e.getMessage());
				System.out.println("응안돼");
			} catch (Exception e1) {
				e1.printStackTrace();
			}
	    }

	    out.print(jsonObject.toString());
	    out.flush();
	    out.close();

	    return "redirect:" + request.getContextPath(); // JSON response를 직접 보내므로 null이어도 된다?
	}

}
