package joybank.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import biz.account.SavingAccountVO;
import biz.account.service.AccountService;
import biz.user.UserVO;
import joybank.controller.Controller;

public class CheckDormantController implements Controller {
    private AccountService accountService;

    public CheckDormantController() {
        this.accountService = AccountService.getInstance();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String userId = null;
        System.out.println("체크용" + userId);
        if (loginUser != null) {
            userId = loginUser.getU_id();
        }
        List<SavingAccountVO> dormantAccounts = accountService.getDormantAccountsById(userId);
        System.out.println(dormantAccounts);
        Gson gson = new Gson();

        boolean hasDormantAccounts = hasDormantAccounts(dormantAccounts);

        if (hasDormantAccounts) {
            // 휴면 계좌가 있는 경우 모달 팝업을 띄우고 사용자의 선택에 따라 동작 수행
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("dormantAccount", hasDormantAccounts);

            String json = jsonObject.toString();

            try {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "/jsp/account/createaccount.jsp"; // JSON 응답을 반환하지 않으므로 뷰 페이지 이름은 null로 설정합니다.
        } else {
            // 휴면 계좌가 없는 경우 계좌 개설 페이지로 리다이렉션
            return "redirect:/jsp/account/createaccount.jsp";
        }
    }
        
       /* JsonObject jsonObject = new JsonObject();
        jsonObject.add("dormantAccounts", gson.toJsonTree(dormantAccounts));
        jsonObject.addProperty("dormantAccount", hasDormantAccounts);

        String json = jsonObject.toString();

        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/jsp/index.jsp"; // JSON 응답이므로 뷰 페이지 이름은 필요하지 않습니다.
    }
    */

    private boolean hasDormantAccounts(List<SavingAccountVO> dormantAccounts) {
        return dormantAccounts.size() > 0;
    }
}

	/*
	 * @Override public String handleRequest(HttpServletRequest request,
	 * HttpServletResponse response) { HttpSession session = request.getSession();
	 * UserVO loginUser = (UserVO) session.getAttribute("loginUser"); String userId
	 * = null; if (loginUser != null) { userId = loginUser.getU_id(); }
	 * System.out.println("체크용"+userId); List<SavingAccountVO> dormantAccounts =
	 * accountService.getDormantAccountsById(userId);
	 * System.out.println(dormantAccounts); Gson gson = new Gson(); String json =
	 * gson.toJson(dormantAccounts);
	 * 
	 * try { response.setContentType("application/json");
	 * response.setCharacterEncoding("UTF-8"); response.getWriter().write(json); }
	 * catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return null; // JSON 응답이므로 뷰 페이지 이름은 필요하지 않습니다. }
	 */
   /* public CheckDormantController() {
        this.accountService = AccountService.getInstance();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
     
    	HttpSession session = request.getSession();
    	UserVO loginUser = (UserVO) session.getAttribute("loginUser");
    	String userId = null;
       // String userId = (String) session.getAttribute("userId");
    	if (loginUser != null) {
    	    userId = loginUser.getU_id();
    	}
    	System.out.println("체크용"+userId);
        List<SavingAccountVO> dormantAccounts = accountService.getDormantAccountsById(userId);

        Gson gson = new Gson();
        String json = gson.toJson(dormantAccounts);

        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // JSON 응답이므로 뷰 페이지 이름은 필요하지 않습니다.
    }
}*/
/*	private AccountService accountService;
	
	public CheckDormantController () {
		this.accountService = AccountService.getInstance();
	}
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		 HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute("userId");

	        List<SavingAccountVO> dormantAccounts = accountService.getDormantAccountsById(userId);
	        request.setAttribute("dormantAccounts", dormantAccounts);

	        // 뷰 페이지 이름을 반환합니다.
	        return "/jsp/index.jsp";
	    }
	}*/