package biz.common;

import java.sql.Connection;
import java.sql.DriverManager;

//커넥션 객체를 얻어오는게 목적
public class ConnectionFactory {

	public Connection getConnection() throws Exception { //이렇게 해도 됨
		
		Connection conn = null;
		System.out.println("내가 돌아가고 있나요?");
//		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
//			Class.forName("org.h2.Driver");
//			String url = "jdbc:h2:tcp://localhost/~/test";
//			String user = "sa";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";
			
//			conn = DriverManager.getConnection(url, user, "");
			conn = DriverManager.getConnection(url, user, password);
			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		return conn;
	}
	/*
	 * 오버로딩... 라이딩이 xㅇㅇ
	 */
}
