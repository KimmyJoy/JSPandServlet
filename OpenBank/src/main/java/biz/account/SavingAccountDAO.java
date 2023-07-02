package biz.account;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import biz.user.UserVO;
import biz.user.service.UserService;
import joybank.common.ConnectionFactory;
import joybank.util.AccountNumUtil;

public class SavingAccountDAO {
	private UserService service = UserService.getInstance();
	
	 // 계좌를 생성하는 메소드
	public SavingAccountVO createAccount(SavingAccountVO account) {
	    SavingAccountVO createdAccount = null;
	    UserVO user = null;
	    
	    while (true) {
	        String acc_no = AccountNumUtil.generateAccountNumber(account.getBank_cd(), account.getU_id());
	        //중복 체크를 위한 구문 추가
	        if (!isAccountNumberExist(acc_no)) {
	            account.setAcc_no(acc_no);
	            
	            StringBuilder sql = new StringBuilder();
	            sql.append("INSERT INTO Saving_Account (bank_cd, acc_no, u_id, acc_nm, acc_pw, acc_bal, rate, acc_stat, u_email) ");
	            sql.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
	            
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
	                pstmt.setString(9, account.getAcc_stat());
	                pstmt.setString(10, user.getU_email());

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
		
	
	 public List<SavingAccountVO> getAccountsById(String userId) {
	        List<SavingAccountVO> accounts = new ArrayList<>();

	        String sql = "SELECT * FROM SAVING_ACCOUNT WHERE U_ID = ?";

	        try (
	            Connection conn = new ConnectionFactory().getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql)
	        ) {
	            pstmt.setString(1, userId);
	            ResultSet rs = pstmt.executeQuery();

	            while (rs.next()) {
	                SavingAccountVO account = new SavingAccountVO();
	                account.setBank_cd(rs.getString("bank_cd"));
	                account.setAcc_no(rs.getString("acc_no"));
	                account.setU_id(rs.getString("u_id"));
	                account.setAcc_nm(rs.getString("acc_nm"));
	                account.setAcc_pw(rs.getString("acc_pw"));
	                account.setAcc_bal(rs.getLong("acc_bal"));
	                account.setRate(rs.getDouble("rate"));
	                account.setU_email(rs.getString("u_email"));
	                account.setAcc_stat(rs.getString("acc_stat"));
	                accounts.add(account);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return accounts;
	    }
	
	 //계좌 번호로 목록을 가져오는 메서드
	 public SavingAccountVO getAccountByAccNo(String accNo) {
		    SavingAccountVO account = null;

		    String sql = "SELECT * FROM SAVING_ACCOUNT WHERE ACC_NO = ?";

		    try (
		        Connection conn = new ConnectionFactory().getConnection();
		        PreparedStatement pstmt = conn.prepareStatement(sql)
		    ) {
		        pstmt.setString(1, accNo);

		        ResultSet rs = pstmt.executeQuery();

		        if (rs.next()) {
		            account = new SavingAccountVO();
		            account.setAcc_no(rs.getString("ACC_NO"));
		            account.setBank_cd(rs.getString("BANK_CD"));
		            account.setU_id(rs.getString("U_ID"));
		            account.setAcc_nm(rs.getString("ACC_NM"));
		            account.setAcc_pw(rs.getString("ACC_PW"));
		            account.setAcc_bal(rs.getLong("ACC_BAL"));
		            account.setRate(rs.getDouble("RATE"));
		            account.setAcc_stat(rs.getString("ACC_STAT"));
		            account.setU_email(rs.getString("U_EMAIL"));
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return account;
		}

	 
	// 계좌 상태를 업데이트하는 메서드
	    public void updateAccountStatus(String accNo, String status) {
	        String sql = "UPDATE SAVING_ACCOUNT SET ACC_STAT = ? WHERE ACC_NO = ?";

	        try (
	            Connection conn = new ConnectionFactory().getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql)
	        ) {
	            pstmt.setString(1, status);
	            pstmt.setString(2, accNo);
	            pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
	//프로시저호출
	public void transfer(String fromAccount, String toAccount, double amount) throws Exception {
        String sql = "{ call TRANSFER(?, ?, ?) }";
        Connection conn = new ConnectionFactory().getConnection();
        CallableStatement cs = conn.prepareCall(sql);
        cs.setString(1, fromAccount);
        cs.setString(2, toAccount);
        cs.setDouble(3, amount);
        cs.executeUpdate();
    }
	//휴면 계좌 검색 로직
	public List<SavingAccountVO> getDormantAccountsById(String userId) {
	    List<SavingAccountVO> accounts = new ArrayList<>();

	    String sql = "SELECT * FROM SAVING_ACCOUNT WHERE U_ID = ? AND ACC_STAT = 'U'";

	    try (
	        Connection conn = new ConnectionFactory().getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql)
	    ) {
	        pstmt.setString(1, userId);
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            SavingAccountVO account = new SavingAccountVO();
	            account.setBank_cd(rs.getString("bank_cd"));
	            account.setAcc_no(rs.getString("acc_no"));
	            account.setU_id(rs.getString("u_id"));
	            account.setAcc_nm(rs.getString("acc_nm"));
	            account.setAcc_pw(rs.getString("acc_pw"));
	            account.setAcc_bal(rs.getLong("acc_bal"));
	            account.setRate(rs.getDouble("rate"));
	            account.setU_email(rs.getString("u_email"));
	            account.setAcc_stat(rs.getString("acc_stat"));
	            accounts.add(account);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return accounts;
	}

	/*
	 * // 휴면 계좌 존재 여부를 확인하는 메서드(유효성 검사용) public boolean hasDormantAccount(String
	 * userId) { boolean hasDormantAccount = false;
	 * 
	 * String sql =
	 * "SELECT COUNT(*) FROM SAVING_ACCOUNT WHERE U_ID = ? AND ACC_STAT = 'U'";
	 * 
	 * try ( Connection conn = new ConnectionFactory().getConnection();
	 * PreparedStatement pstmt = conn.prepareStatement(sql) ) { pstmt.setString(1,
	 * userId); ResultSet rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { int count = rs.getInt(1); hasDormantAccount = count > 0; } }
	 * catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return hasDormantAccount; }
	 */
	
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
