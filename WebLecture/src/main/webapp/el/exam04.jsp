<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kr.ac.kopo.book.BookVO" %>
<%--
	String[] titleArray = {"성공"};
	pageContext.setAttribute("books", titleArray);
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		ArrayList<BookVO> b = new ArrayList<>();
		BookVO book = new BookVO();
		book.setTitle("성공");
		
		b.add(book);
		
		pageContext.setAttribute("books", b);
	%>
<%--
	/*ArrayList<HashMap<String, String>> bookList = new ArrayList<>();  */
	HashMap<String, String> b = new HashMap<>();
	b.put("title", "성공");
	bookList.add(b);
	
	pageContext.setAttribute("book", bookList);
	/* BookVO book = new BookVO();
	pageContext.setAttribute("book", b); */
--%>

    성공/실패?? (b)${books[0].title()}<br>
</body>
</html>
