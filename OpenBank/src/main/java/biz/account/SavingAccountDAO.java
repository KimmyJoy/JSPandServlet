package biz.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import joybank.common.ConnectionFactory;
import joybank.util.AccountNumUtil;

public class SavingAccountDAO {

//	
//	public void updateAccount(SavingAccountVO account) {
//		// 데이터베이스에 계좌 정보를 업데이트하는 코드
//	}
//	
//	public SavingAccountVO getAccount(String acc_num) {
//        // 데이터베이스로부터 계좌 정보를 가져오는 코드
//		
//    }
//
//	public SavingAccountVO getByid(String id) {
//		StringBuilder sql = new StringBuilder();
//		sql.append("");
//		
//	}
	
	
	 // 계좌를 생성하는 메소드
	public SavingAccountVO createAccount(SavingAccountVO account) {
	    SavingAccountVO createdAccount = null;
	    
	    while (true) {
	        String acc_no = AccountNumUtil.generateAccountNumber(account.getBank_cd(), account.getU_id());
	        //중복 체크를 위한 구문 추가
	        if (!isAccountNumberExist(acc_no)) {
	            account.setAcc_no(acc_no);
	            
	            StringBuilder sql = new StringBuilder();
	            sql.append("INSERT INTO Saving_Account (bank_cd, acc_no, u_id, acc_nm, acc_pw, acc_bal, rate) ");
	            sql.append("VALUES (?, ?, ?, ?, ?, ?, ?)");
	            
	            try (
	            		Connection conn = new ConnectionFactory().getConnection();
	            		PreparedStatement pstmt = conn.prepareStatement(sql.toString())
	            	) {
	                pstmt.setString(1, account.getBank_cd());
	                pstmt.setString(2, account.getAcc_no());
	                pstmt.setString(3, account.getU_id());
	                pstmt.setString(4, account.getAcc_nm());
	                pstmt.setString(5, account.getAcc_pw());
	                pstmt.setLong(6, account.getAcc_bal());
	                pstmt.setDouble(7, account.getRate());

	                pstmt.executeUpdate();
	                createdAccount = account;  // 계좌 생성이 성공했으므로 반환할 계좌를 설정
	                break;
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    return createdAccount;  // 생성된 계좌를 반환, 실패했을 경우 null 반환
	}


    // 계좌 번호가 이미 존재하는지 확인하는 메소드
//	private boolean isAccountNumberExist(String acc_no) {
//	    boolean isExist = false;
//	    
//	    StringBuilder sql = new StringBuilder();
//	    sql.append("SELECT * FROM Saving_Account WHERE acc_no = ?");
//	    
//	    try (
//	    	Connection conn = new ConnectionFactory().getConnection();
//	        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//	        ResultSet rs = pstmt.executeQuery()
//	    ) {
//	        pstmt.setString(1, acc_no);
//	        if (rs.next()) {
//	            isExist = true;
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//	    
//	    return isExist;
//	}
	// 계좌 번호가 이미 존재하는지 확인하는 메소드
	private boolean isAccountNumberExist(String acc_no) {
	    boolean isExist = false;

	    StringBuilder sql = new StringBuilder();
	    sql.append("SELECT * FROM Saving_Account WHERE acc_no = ?");

	    try (
	        Connection conn = new ConnectionFactory().getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql.toString())
	    ) {
	        pstmt.setString(1, acc_no);  // 쿼리 실행 전에 매개변수 설정

	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                isExist = true;
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isExist;
	}
}
