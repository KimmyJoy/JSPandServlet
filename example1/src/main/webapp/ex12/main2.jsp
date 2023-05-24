<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <!-- java.util을 전부 다 쓰겠다는 소리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<!-- el은 일단 한번 컴파일을 하고 실행된다 
그래서 정수형은 정수형대로 들어가고 부동소수점형은 부동소수점 형으로 다 들어감 -->
<body>
<%
request.setAttribute("attr", "hello world");
%>
<%=
request.getAttribute("attr")
%><br/>
${requestScope["attr"]}<br/>
${requestScope.attr}<br/>
<!--
${requestScope["attr2"]}<br/>  <- 이건 해당하는 내용이 없어서 안나옴 -->
</body>
</html>