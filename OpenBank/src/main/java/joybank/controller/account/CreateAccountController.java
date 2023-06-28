package joybank.controller.account;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.account.SavingAccountVO;
import biz.account.service.AccountService;
import joybank.controller.Controller;

public class CreateAccountController implements Controller {

    private AccountService accountService;

    public CreateAccountController() {
        this.accountService = AccountService.getInstance();
    }

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String acc_pw = request.getParameter("acc_pw");
        String acc_nm = request.getParameter("acc_nm");  // 계좌 이름을 요청으로부터 가져옴
        
     // 세션에서 사용자 ID 가져오기
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        
        // 계좌 생성을 위한 SavingAccountVo 객체 생성
        SavingAccountVO account = new SavingAccountVo();
        account.setU_id(user_id);
        account.setAcc_nm(acc_nm);
        account.setAcc_pw(acc_pw);
        account.setAcc_bal(0);  // 초기 계좌 잔액은 0으로 설정
        account.setRate(0.10);  // 이자율은 일단 0.01로 설정, 실제로는 더 복잡한 로직이 필요할 수 있음

        // Create a new account through the service
        SavingAccountVo newAccount = accountService.updateAccount(account);

        // Set the new account as a request attribute so it can be accessed by the view
        request.setAttribute("account", newAccount);

        // Return the name of the view page
        return "accountDetails";
    }
}

