package joybank.account;

import joybank.controller.Controller;

public class AccountController implements Controller {

	 private AccountService accountService;

	    public AccountController() {
	        this.accountService = AccountService.getInstance();
	    }

	    @Override
	    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	        String accountNumber = request.getParameter("accountNumber");
	        Account account = accountService.getAccount(accountNumber);

	        if(account == null) {
	            request.setAttribute("error", "Account not found");
	            return "error";
	        }

	        request.setAttribute("account", account);
	        return "accountDetail";
	    }
	}
