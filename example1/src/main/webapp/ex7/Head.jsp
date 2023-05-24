<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 위는 jsp 파일임을 의미함 이 페이지를 받는 브라우저가 이걸 어떻게 해석하는지 알게 해주는 부분
아래 구조는 html 그대로임 jsp임을 구별해주는건 위의 내용뿐-->
<!-- @ 브븐ㅇ,ㄴ 임포트 시켜주는 것 -->
<%@ page import="java.util.Date"%>
<%@ page session="false"%>

<%!
	Date date;
	String name;
	String email;
	%>

<%!
	public int getLength() {
	int len = email.length();
	return len;
}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>스크립트 테스트</h1>
	<%
	date = new Date();
	%>
	현재날짜:
	<%=date.toLocaleString()%>
</body>
</html>