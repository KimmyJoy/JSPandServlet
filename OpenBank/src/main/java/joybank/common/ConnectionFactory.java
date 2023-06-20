package joybank.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {



		public Connection getConnection() throws Exception { //이렇게 해도 됨
			
			Connection conn = null;
			System.out.println("내가 돌아가고 있나요?");
//			try {
			//하단에 기재된 class.forname으로 들어 가는 것이 reflection임
				Class.forName("oracle.jdbc.driver.OracleDriver");
//				Class.forName("org.h2.Driver");
//				String url = "jdbc:h2:tcp://localhost/~/test";
//				String user = "sa";
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String user = "hr";
				String password = "hr";
				
				conn = DriverManager.getConnection(url, user, password);
				
			return conn;
		}
	}
	
