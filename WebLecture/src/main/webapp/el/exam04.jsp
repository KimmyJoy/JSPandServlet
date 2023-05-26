<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="kr.ac.kopo.book.BookVO" %>
<%--
	el�� �ؼ������ ���� back���̶� ���������� � ��������, ��� ���ƿ����� Ŭ���̾�Ʈ �ҽ� �ʿ����� ������ �ʱ� ������ �ſ� �߿��ϴ�
	�׷��� �갡 ������ �����ΰ��� ���ƿ��� �����͵��� �׶� �׶����� �ٸ��ϱ� Ŭ���̾�Ʈ�� �������� ������ �� ������ �ڹٽ�ũ��Ʈ�� ����ȴ�
	jstl�� �ſ� �߿��ϴ�
--%>
<%--
	String[] titleArray = {"����"};
	pageContext.setAttribute("books", titleArray);
--%>
<%-- <% 
	//1. �ڹٺ���Ŭ���� + �迭
	BookVO book = new BookVO();
	book.setTitle("����");
	//��ü�� ����� 0��°�� �־� �� ��
	
	BookVO[] books = { book };
	
	pageContext.setAttribute("books", books);
%> --%>
<%-- <%
	// 2. Map ��ü + �迭
	Map<String, String> book = new HashMap<>();
	book.put("title", "����");
	
	Map[] books = { book };//�� ���¸� ���� �迭�� �� ��
	
	pageContext.setAttribute("books", books);
%> --%>
<%-- <%
	//3. �ڹٺ���Ŭ���� + �ݷ��� <- ���� ���� ���̴� ����ε� map�� �������� ���� ���ȴ�
	BookVO book = new BookVO();
	book.setTitle("����");
	
	List<BookVO> books = new ArrayList<>();
	books.add(book);
	
	pageContext.setAttribute("books", books);
%> --%>
<%
	// 4. Map ��ü + �÷��� : return�� �ι� �� �� �����ϱ� 
	Map<String, String> book = new HashMap<>();
	book.put("title", "����");
	
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
    ����/����?? ${books[0].title}<br>
    <!-- ���������� books��� �ְ� �ִ� �Ű� []�� �� �� �ִٴ� ���� map/�迭/collection �ۿ� ����
    .title .�� �� �� �ִٴ� �� javabeans Ȥ�� map ��ü���� �Ѵٴ� �Ҹ� -->
</body>
</html>
