package joybank.controller;

	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	public class CallbackController implements Controller {

	    @Override
	    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	        String code = request.getParameter("code");
	        String state = request.getParameter("state");

	        // TODO: Use the code to request an access token
	        // String accessToken = ...

	        // TODO: Use the access token to retrieve user info
	        // UserInfo userInfo = ...

	        // TODO: Create a session or do other things with the user info

	        // Redirect the user to their account page or wherever they need to go
	        return "redirect:/main";
	    }
	}

	
