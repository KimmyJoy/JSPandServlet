<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <!-- java.util�� ���� �� ���ڴٴ� �Ҹ� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<!-- el�� �ϴ� �ѹ� �������� �ϰ� ����ȴ� 
�׷��� �������� ��������� ���� �ε��Ҽ������� �ε��Ҽ��� ������ �� �� -->
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
${requestScope["attr2"]}<br/>  <- �̰� �ش��ϴ� ������ ��� �ȳ��� -->
</body>
</html>