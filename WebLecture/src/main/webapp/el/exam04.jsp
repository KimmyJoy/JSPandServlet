<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kr.ac.kopo.book.BookVO" %>
<%--
	el의 해석기관은 전부 back쪽이라서 웹페이지에 어떤 형태인지, 어떻게 날아오는지 클라이언트 소스 쪽에서는 보이지 않기 때문에 매우 중요하다
	그래서 얘가 동적인 형태인거임 날아오는 데이터들이 그때 그때마다 다르니까 클라이언트는 정적으로 느껴짐 그 다음에 자바스크립트가 시행된다
	jstl도 매우 중요하다
--%>
<%--
	String[] titleArray = {"성공"};
	pageContext.setAttribute("books", titleArray);
--%>
<%-- <% 
	//1. 자바빈즈클래스 + 배열
	BookVO book = new BookVO();
	book.setTitle("성공");
	//객체를 만들고 0번째에 넣어 준 것
	
	BookVO[] books = { book };
	
	pageContext.setAttribute("books", books);
%> --%>
<%-- <%
	// 2. Map 객체 + 배열
	Map<String, String> book = new HashMap<>();
	book.put("title", "성공");
	
	Map[] books = { book };//맵 형태를 가진 배열이 될 것
	
	pageContext.setAttribute("books", books);
%> --%>
<%-- <%
	//3. 자바빈즈클래스 + 콜렉션 <- 가장 많이 쓰이는 방식인데 map이 생각보다 많이 사용된다
	BookVO book = new BookVO();
	book.setTitle("성공");
	
	List<BookVO> books = new ArrayList<>();
	books.add(book);
	
	pageContext.setAttribute("books", books);
%> --%>
<%
	// 4. Map 객체 + 컬렉션 : return을 두번 할 수 없으니까 
	Map<String, String> book = new HashMap<>();
	book.put("title", "성공");
	
	List<Map<String, String>> books = new ArrayList<>();
	books.add(book);
	
	pageContext.setAttribute("books", books);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    성공/실패?? ${books[0].title}<br>
    <!-- 공유영역에 books라는 애가 있는 거고 []를 쓸 수 있다는 것은 map/배열/collection 밖에 없음
    .title .을 쓸 수 있다는 건 javabeans 혹은 map 객체여야 한다는 소리 -->
</body>
</html>
