package controller.user2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import controller.all.Controller;

public class LogoutController implements Controller {

		@Override
		public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			return "./jsp/login.jsp";
		}
		
	}

