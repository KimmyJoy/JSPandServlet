package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import biz.common.JDBCUtil;

public class UserDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String USER_INSERT=
			"insert into users (id, password, name, role) "+
					"values (?, ?, ?, ?)";//입력 받는 값이므로 ?로 처리
	
	private static String USER_GET=
			"select * from users where id=? and password=?";
	
	public void insertUser(UserVO vo) {
	//클래스를 매개변수로 받음	
		try {
			//db로 부터 연결을 받음
			conn = JDBCUtil.getConnection();
				//이쪽에서 클래스명으로 불러오려면 해당 클래스가 static이어야함
			stmt = conn.prepareStatement(USER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getRole());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt,  conn);
		}
	}
	
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				//있으면 내부 변수로 선언한 user에 넣음
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
			}
			
		} catch (Exception e) {	
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
	
//	public List<> checkUser(UserVO vo) {
//		//매개 변수로 받은 것을...하던 흔적
//		try {
//			//db로 부터 연결을 받음
//			conn = JDBCUtil.getConnection();
//				//이쪽에서 클래스명으로 불러오려면 해당 클래스가 static이어야함
//			stmt = conn.prepareStatement(USER_INFO);
//			stmt.setString(1, vo.getId());
//			stmt.setString(2, vo.getPassword());
//			stmt.setString(3, vo.getName());
//			stmt.setString(4, vo.getRole());
//			stmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(stmt,  conn);
//		}
//	}
	
}
