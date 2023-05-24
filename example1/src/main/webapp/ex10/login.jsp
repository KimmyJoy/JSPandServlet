<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="ex10.LoginBean"/>
<!-- 위에서의 id는 loginbean의 인스턴스를 login으로 이름을 정해주는 역할 -->
<jsp:setProperty name = "login" property= "id"/>
<jsp:setProperty name = "login" property= "passwd"/>
<!-- name 뒤는 jsp의 파일명 property는 정확하게는 LoginBean에 있는 변수명임-->
<%
if(login.dbCheck()){
%>
<jsp:getProperty property="id" name="login"/>님이 로그인했습니다.
<%
} else {
%>
<jsp:forward page="Login.html"/>
<%
}
%>	
</body>
</html>