<%@page import="biz.user.UserVO"%>
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
			sql.append(" from t_member ");
			sql.append(" where id = ? and password = ? ");
			
	/* try(		
	Connection conn = DriverManager.getConnection(url, user, pass);
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	) {
		
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		
		ResultSet rs = pstmt.executeQuery();
		//결과가 최대 1개 최소 0개가 나올 것(매칭된건 1개, 안된건 0개) 그래서 이걸 true false화 가능
		// = new MemberVO();
		
		String msg = "";
		String locUrl = "";
		if(rs.next()) {
			//로그인 성공시
			MemberVO loginUser = new MemberVO();
			loginUser.setId(rs.getString("id"));
			loginUser.setPassword(rs.getString("password"));
			loginUser.setName(rs.getString("name"));
			loginUser.setType(rs.getString("type"));
			
			msg = loginUser.getName() + "님 환영합니다";
			locUrl = "/WebTest"; //잘되면 메인페이지에
			//공유 영역에 등록시켜야함 session에
			session.setAttribute("loginUser", loginUser);
		} else {
			msg = "입력하신 ID 또는 패스워드가 잘못되었습니다";
			locUrl = "login.jsp";//입력이 잘못되면 다시 로그인 페이지로 보내고 싶은 것
		}
		
		pageContext.setAttribute("msg", msg);
		pageContext.setAttribute("url", locUrl);
		//출력메시지와 보내야하는 url을 함께 묶어서 한 것
		
	} catch(Exception e) {
		e.printStackTrace();
	} */
	
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
			loginUser.setRole(rs.getString("role"));
			
			msg = loginUser.getName() + "님 환영합니다";
			locUrl = "/MyLibrary";
			
			session.setAttribute("loginUser", loginUser);
			
		} else {
			msg = "입력하신 ID 또는 패스워드가 잘못되었습니다";
			locUrl = "login.jsp";
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