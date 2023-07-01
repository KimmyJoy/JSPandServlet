package biz.transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import joybank.common.ConnectionFactory;

public class TransactionDAO {

	
	
	public void createTransaction(TransactionVO transaction) throws Exception {
        String sql = "INSERT INTO TRANSACTION_HISTORY (TRANS_NO, ACC_NO, SENDER_BANK_CD, TRANS_AMOUNT, RECIVER_BANK_CD, RECIVER, TRAN_TYPE, TRAN_DATE, TRAN_NM) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        Connection conn = new ConnectionFactory().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, transaction.getTrans_no());
        ps.setString(2, transaction.getAcc_no());
        ps.setString(3, transaction.getSend_bank_cd());
        ps.setLong(4, transaction.getTrans_amount());
        ps.setString(5, transaction.getRecieve_bank_cd());
        ps.setString(6, transaction.getReciever());
        ps.setString(7, transaction.getTrans_type());
        ps.setTimestamp(8, new Timestamp(transaction.getTrans_date()));
        ps.setString(9, transaction.getTrans_memo());
        ps.executeUpdate();
    }
	
}
