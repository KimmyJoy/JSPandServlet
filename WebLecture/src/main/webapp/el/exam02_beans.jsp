<%@page import="kr.ac.kopo.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%//�� �κе��� ���� �������� �ٲ�
	BookVO b = new BookVO();
//import�� ���� ����Ű : ctrl+space
	b.setIsbn("123-456");
	b.setTitle("EL�̶� �����ΰ�?");
	b.setWriter("������ ������");
	
//��������(pageConten)�� "book"�̶� �̸����� ������ BookVo��ü�� ��Ͻ�Ű���� �ϴ� ��
	pageContext.setAttribute("book", b);//�̸��� b�� ��ü�� �˰� ����
	//"book" ��ü ��ȸ
	BookVO book = (BookVO)pageContext.getAttribute("book");
	// book���� ã�Ƽ� ���� ���� object ���̶� ����� ����ȯ�� �ؾ���

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	ISBN : <%= book.getIsbn() %><br>
	<%-- �� ������ ������ ����ȯ ������ �ƴ϶�� ����ϴ� ��� --%>
	ISBN : <%= ((BookVO)pageContext.getAttribute("book")).getIsbn() %><br>
 	<%-- el ������� �������� ��� --%> 
 	EL ISBN : ${ book.isbn }<br>
 	EL TITLE : ${ book.title }<br>
 	<%-- ������� �̷��� ����� �ٵ� �����Ȱ� EL TITLE : ${ pageScope.book.title } -->
	  EL COMPANY : ${ book.company }--%>
	EL TITLE : ${book['title'] }
</body>
</html>