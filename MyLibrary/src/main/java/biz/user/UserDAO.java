package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import biz.common.JDBCUtil;

public class UserDAO {

	private static final String USER_INSERT =
			"INSERT INTO users (id, password, name, phonenum, email, role) VALUES (?, ?, ?, ?, ?, ?)";
	
	private static final String USER_GET =
			"SELECT * FROM users WHERE id=? AND password=?";
	
	public void insertUser(UserVO vo) {
		//시퀀스를 넣을까 말까...
		try (Connection conn = JDBCUtil.getConnection();
			 PreparedStatement stmt = conn.prepareStatement(USER_INSERT)) {
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getPhonenum());
			stmt.setString(5, vo.getEmail());
			stmt.setString(6, vo.getRole());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		
		try (Connection conn = JDBCUtil.getConnection();
			 PreparedStatement stmt = conn.prepareStatement(USER_GET)) {
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					user = new UserVO();
					user.setId(rs.getString("ID"));
					user.setPassword(rs.getString("PASSWORD"));
					user.setName(rs.getString("NAME"));
					user.setPhonenum(rs.getString("Phonenum"));
					user.setEmail(rs.getString("EMAIL"));
					user.setRole(rs.getString("ROLE"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return user;
	}
	
	//builder를 쓸지 말지 고민중(sql을 처리하는게 더 빠르기 때문에...)
//	private String buildUserInsertQuery() {
//		StringBuilder sb = new StringBuilder();
//		sb.append("INSERT INTO users (id, password, name, role) ")
//		  .append("VALUES (?, ?, ?, ?)");
//		return sb.toString();
//	}
//	
//	private String buildUserGetQuery() {
//		StringBuilder sb = new StringBuilder();
//		sb.append("SELECT * FROM users ")
//		  .append("WHERE id=? AND password=?");
//		return sb.toString();
//	}
}
