<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	ArrayList<String> nameList = new ArrayList<>();
	nameList.add("홍길동");
	nameList.add("강길동");
	nameList.add("고길동");
	
	pageContext.setAttribute("names", nameList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
첫번째 이름 : <%= nameList.get(0) %><br>
첫번째 이름 : <%= ((ArrayList)pageContext.getAttribute("names")).get(0) %><br>
EL 첫번째 이름 : ${ names[0] } <br>
<%-- el을 잘 알아야 덜 복잡하게 쓸 수 있음 여긴 empty 처리가 되므로 에러가 안나는데
자바빈즈는 메소드가 없는거라 서버오류를 뿜어냄--%>
</body>
</html>