<%@page import="kr.ac.kopo.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BookVO book = new BookVO("123-456", "JSTL", "홍길동");
//헌데 만약, 악의적으로 이런 형태로 하면 아랫단이 생성되지 않고 예전에 바이러스 난리 같은 것들을 발생시킬 수 있음...이를 방지하기 위한 부분이 out 태그임
//BookVO book = new BookVO("123-456", "<a href='https://www.naver.com/'>JSTL</a>", "홍길동");

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