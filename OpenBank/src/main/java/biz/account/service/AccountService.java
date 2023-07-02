package biz.account.service;

import java.util.List;

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

 // 유저 아이디를 기반으로 해당 유저의 모든 계좌를 가져오는 메소드
    public List<SavingAccountVO> getAccountList(String userId) {
        return accountDAO.getAccountsById(userId);
    }

    public List<SavingAccountVO> getDormantAccountsById(String userI){
    	return accountDAO.getDormantAccountsById(userI);
    }
    
    // 계좌의 상태를 업데이트하는 메소드
    public SavingAccountVO updateAccountStatus(String accNo, String status) {
    	 SavingAccountVO account = accountDAO.getAccountByAccNo(accNo);
    	    if (account != null) {
    	        account.setAcc_stat(status);
    	        accountDAO.updateAccountStatus(accNo, status);
    	    }
    	    return account;
    	}
    
    
    
}


