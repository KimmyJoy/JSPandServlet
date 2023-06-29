package biz.account.service;

import biz.account.SavingAccountDAO;
import biz.account.SavingAccountVO;

public class AccountService {
	private static AccountService instance = null;
    private SavingAccountDAO accountDAO;

    private AccountService() {
        accountDAO = new SavingAccountDAO();
    }
    
    public static AccountService getInstance() {
    	if (instance == null) {
    		instance = new AccountService();
    	}
    	return instance;
    }
    
    public SavingAccountVO updateAccount(SavingAccountVO acc) {
    	
    	 // 계좌 생성 후 반환된 계좌 정보를 newAccount에 저장
        SavingAccountVO newAccount = accountDAO.createAccount(acc);
        return newAccount;
    }

}


