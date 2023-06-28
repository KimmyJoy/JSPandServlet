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
    
    public void updateAccount(SavingAccountVO acc) {
    	
    	accountDAO.updateAccount(acc);
    }

	/*
	 * public SavingAccountVO getByid(String id) {
	 * 
	 * }
	 */
    
}


