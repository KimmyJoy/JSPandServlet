package biz.transaction.service;

import biz.transaction.TransactionDAO;
import biz.transaction.TransactionVO;

public class TransactionService {

	private static TransactionService instance = null;
	private TransactionDAO tdao;
	
	private TransactionService() {
		tdao = new TransactionDAO();
	}

	    public static TransactionService getInstance() {
	    	if(instance == null) {
	    		instance = new TransactionService();
	    }
	    return instance;
	    }
	    
	    public void updateTransaction(TransactionVO tran) {
	    
	    	try {
				tdao.createTransaction(tran);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	
}
