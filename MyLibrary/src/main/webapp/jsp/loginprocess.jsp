<%@page import="biz.user.lib.UserVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 
	작업순서
	1. 파라미터 추출(아이디, 패스워드) ~ 날아온 파라미터 값
	2. 추출된 파라미터를 가진 회원 검색
	3. 검색 결과에 따른 화면을 구성
*/

	request.setCharacterEncoding("UTF-8");
//인코딩 순서는 반드시 첫번째로 위치해야함
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//post 방식일때는 반드시 인코딩을 해줘야함
	System.out.println("id : " + id + ", password : "+password);
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//서블릿을 거칠 때 service에서 내부적으로 try catch로 묶고 있기 때문에 예외처리 코드 안기재해도 됨
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
	
	StringBuilder sql = new StringBuilder();
			sql.append("select * ");
			sql.append(" from t_user ");
			sql.append(" where id = ? and password = ? ");
			
	try(
		Connection conn = DriverManager.getConnection(url, user, pass);
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	) {
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		
		ResultSet rs = pstmt.executeQuery();
		
		String msg = "";
		String locUrl = "";
		if(rs.next()) {
			
			UserVO loginUser = new UserVO();
			loginUser.setId(rs.getString("id"));
			loginUser.setPassword(rs.getString("password"));
			loginUser.setName(rs.getString("name"));
			loginUser.setPhonenum(rs.getString("phonenum"));
			loginUser.setEmail(rs.getString("email"));
			loginUser.setRole(rs.getString("role"));
			
			msg = loginUser.getName() + "님 환영합니다";
			locUrl = "/MyLibrary";
			
			session.setAttribute("loginUser", loginUser);
			
		} else {
			msg = "입력하신 ID 또는 패스워드가 잘못되었습니다";
			locUrl = "login.do";
		}
		
		pageContext.setAttribute("msg", msg);
		pageContext.setAttribute("url", locUrl);
		
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<script>
	alert('${ msg }')
	location.href = '${ url }'
</script>     
<%-- <script>
alert('${ msg }')
//history.go(-1);
location.href = '${url}'
//
</script>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
${ msg }
</body>
</html> --%>