<%@page import="kr.ac.kopo.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%//이 부분들이 전부 서블릿으로 바뀜
	BookVO b = new BookVO();
//import를 위한 단축키 : ctrl+space
	b.setIsbn("123-456");
	b.setTitle("EL이란 무엇인가?");
	b.setWriter("여긴어디 난누구");
	
//공유영역(pageConten)에 "book"이란 이름으로 생성된 BookVo객체를 등록시키려고 하는 것
	pageContext.setAttribute("book", b);//이름은 b란 객체가 알고 있음
	//"book" 객체 조회
	BookVO book = (BookVO)pageContext.getAttribute("book");
	// book으로 찾아서 오는 것은 object 형이라서 명시적 형변환을 해야함

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	ISBN : <%= book.getIsbn() %><br>
	<%-- 위 영역에 쓰여진 형변환 내용이 아니라면 써야하는 방법 --%>
	ISBN : <%= ((BookVO)pageContext.getAttribute("book")).getIsbn() %><br>
 	<%-- el 방식으로 가져오는 방식 --%> 
 	EL ISBN : ${ book.isbn }<br>
 	EL TITLE : ${ book.title }<br>
 	<%-- 원래라면 이렇게 써야함 근데 생략된것 EL TITLE : ${ pageScope.book.title } -->
	  EL COMPANY : ${ book.company }--%>
	EL TITLE : ${book['title'] }
</body>
</html>