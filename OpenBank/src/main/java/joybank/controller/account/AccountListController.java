package joybank.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.account.SavingAccountVO;
import biz.account.service.AccountService;
import joybank.controller.Controller;

public class AccountListController implements Controller {
	  private AccountService accountService;

	    public AccountListController() {
	        this.accountService = AccountService.getInstance();
	    }

	    @Override
	    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	        String userId = request.getParameter("u_id");
	        try {
	            List<SavingAccountVO> accounts = accountService.getAccountList(userId);
	            request.setAttribute("accounts", accounts);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "/jsp/account/unfreezaccount.jsp";
	    }
	}
