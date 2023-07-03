package joybank.controller.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.account.SavingAccountVO;
import biz.account.service.AccountService;
import joybank.controller.Controller;

public class AccountStatusUpdateController implements Controller {
	  private AccountService accountService;

	    public AccountStatusUpdateController() {
	        this.accountService = AccountService.getInstance();
	    }

	    @Override
	    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	        String accNo = request.getParameter("acc_no");
	        String status = "N";
	        try {
	            SavingAccountVO account = accountService.updateAccountStatus(accNo, status);
	            request.setAttribute("account", account);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "/jsp/account/unfreezaccount.jsp";
	    }
	}
