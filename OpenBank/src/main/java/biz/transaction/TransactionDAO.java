package biz.transaction;

import java.sql.PreparedStatement;

public class TransactionDAO {

	public void createTransaction(TransactionVO transaction) throws Exception {
        String sql = "INSERT INTO TRANSACTION_HISTORY (TRANS_NO, ACC_NO, SENDER_BANK_CD, AMOUNT, RECIVER_BANK_CD, RECIVER, TRAN_TYPE, TRAN_DATE, TRAN_NM) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, transaction.getTransactionId());
        ps.setString(2, transaction.getAccountId());
        ps.setString(3, transaction.getSenderBankCode());
        ps.setDouble(4, transaction.getAmount());
        ps.setString(5, transaction.getReceiverBankCode());
        ps.setString(6, transaction.getReceiver());
        ps.setString(7, transaction.getTransactionType());
        ps.setTimestamp(8, new Timestamp(transaction.getTransactionDate().getTime()));
        ps.setString(9, transaction.getTransactionName());
        ps.executeUpdate();
    }
	
}
