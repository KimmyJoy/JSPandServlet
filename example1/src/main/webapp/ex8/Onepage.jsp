<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
request.setAttribute("id",id);//웹페이지 끄면 사라짐
session.setAttribute("id", id);//서버쪽 메모리로 서버에 저장 됨
application.setAttribute("id",id);//서버 단에 존재하는 java instance임 jsp도 servlet 중의 하나임
%>
<h1><%= id %>로 로그인 하였습니다.<br/></h1>
<a href="./Twopage.jsp">이동</a>
</body>
</html>