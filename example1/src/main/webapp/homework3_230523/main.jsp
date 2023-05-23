<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Main Service Page</title>
<style>
body {
font-family: 'Nanum Gothic', sans-serif;
text-align: center;
color: #9c63bb;
}

</style>
</head>
<body>
<h1>Main Page</h1>
<%
	// action 변수에 action 파라미터 값을 가져옴
    String action = request.getParameter("action");

	// action이 null이 아니면서 logout 이라면 로그아웃을 진행하고 login.jsp로 이동
    if (action != null && action.equals("logout")) {
        session.invalidate(); 
        response.sendRedirect("login.jsp");
    } else {
    	// 세션에 저장되어있는 로그인 ID값을 가져옴
        String loggedInId = (String) session.getAttribute("id"); 
    	
    	// 로그인 된 사용자일 경우 사용자의 ID정보와 로그아웃 버튼을 출력
        if (loggedInId != null) {
            out.println("로그인 완료 " + loggedInId + "님 환영합니다 🤑ヾ(•ω•`)/");
%>			
			<!-- 로그아웃 버튼 및 기능 구현 -->
            <form method="post" action="main.jsp?action=logout">
                <input type="submit" value="로그아웃">
            </form>
<%
        } else {
        	// 로그인 상태가 아니라면 loginpage.jsp로 이동
            response.sendRedirect("login.jsp"); 
        }
    }
%>
</body>
</html>
