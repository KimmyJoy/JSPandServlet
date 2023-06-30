package joybank.controller.trans;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.account.SavingAccountDAO;
import biz.transaction.TransactionDAO;
import biz.transaction.TransactionVO;
import joybank.controller.Controller;

public class TransferController implements Controller {

	 private SavingAccountDAO accountDao;
	 private TransactionDAO transactionDao;
	    // other fields
	
	
	@Override
	 public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        String fromAccount = request.getParameter("fromAccount");
        String toAccount = request.getParameter("toAccount");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String tranType = request.getParameter("tranType"); // transaction type

        try {
            accountDao.transfer(fromAccount, toAccount, amount);
            // Create transactions
            TransactionVO transactionFrom = new TransactionVO(fromAccount, "SENDER_BANK_CD", amount, toAccount, "RECIVER", tranType, new Date(), "TRAN_NM");
            transactionDao.createTransaction(transactionFrom);
            // Redirect to transaction history page
            response.sendRedirect("/transactions?accountNumber=" + fromAccount);
        } catch (Exception e) {
            // error handling
            e.printStackTrace();
            return "/error.jsp";
        }

        return null; // since we already redirected
    }
	}

