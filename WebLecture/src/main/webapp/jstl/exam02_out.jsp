<%@page import="kr.ac.kopo.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BookVO book = new BookVO("123-456", "JSTL", "ȫ�浿");
//�嵥 ����, ���������� �̷� ���·� �ϸ� �Ʒ����� �������� �ʰ� ������ ���̷��� ���� ���� �͵��� �߻���ų �� ����...�̸� �����ϱ� ���� �κ��� out �±���
//BookVO book = new BookVO("123-456", "<a href='https://www.naver.com/'>JSTL</a>", "ȫ�浿");

	pageContext.setAttribute("book", book);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	ISBN : ${ book.isbn } <br>
	TITLE : <a href="../el/exam04.jsp"><c:out value="${ book.title }"/></a><br>
	WRITER : ${ book.writer }<br>
</body>
</html>