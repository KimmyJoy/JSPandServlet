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
request.setAttribute("id",id);//�������� ���� �����
session.setAttribute("id", id);//������ �޸𸮷� ������ ���� ��
application.setAttribute("id",id);//���� �ܿ� �����ϴ� java instance�� jsp�� servlet ���� �ϳ���
%>
<h1><%= id %>�� �α��� �Ͽ����ϴ�.<br/></h1>
<a href="./Twopage.jsp">�̵�</a>
</body>
</html>