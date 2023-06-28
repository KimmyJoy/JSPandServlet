package joybank.controller.account;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.account.SavingAccountVO;
import biz.account.service.AccountService;
import joybank.controller.Controller;

public class AccountController implements Controller {

	 private AccountService accountService;
	 private String bank_cd;
	 //자사에서 생성되는 은행 코드의 경우 고정값이므로 변수 설정
	 private int rate;
	 
	    public AccountController() {
	        this.accountService = AccountService.getInstance();
	        //파일을 읽어오는 행위이므로 try~catch문 필수
	        try(InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties")) {
	            Properties prop = new Properties();
	            //프로퍼티에 있는 고정된 은행 코드를 가져온다

	            if (input == null) {
	                System.out.println("Sorry, unable to find config.properties");
	                return;
	            }

	            //load a properties file from class path
	            prop.load(input);

	            // get the property value
	            bank_cd = prop.getProperty("bank_cd");
	            rate = prop.getProperty("rate")
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    

	    @Override
	    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
	    	String bank_cd = request.getParameter("bank_cd");
	        String account_no = request.getParameter("accountNumber");
	        String userId = request.getParameter("userId");
	        String acc_pw = request.getParameter("acc_pw");
	        
	     // Create a new account through the service
	        SavingAccountVO newacc = accountService.updateAccount(bank_cd, account_no, userId, acc_pw);

	        // Set the new account as a request attribute so it can be accessed by the view
	        request.setAttribute("account", newAccount);

	        // Return the name of the view page
	        // This assumes that there is a JSP page named "accountDetails.jsp" that can display the account details
	        return "accountDetails";
	        
//	        if(account == null) {
//	            request.setAttribute("error", "Account not found");
//	            return "error";
//	        }
//
//	        request.setAttribute("account", account);
//	        return "accountDetail";
//	    }
	}
}
