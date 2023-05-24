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
request.setAttribute("name", "joy");
//include.jsp가 시행되면서, name 자리엔 joy가 data쪽 파라미터로는 value가 전달됨
//자바 코드 없이 하는 것이 (<%) 없이 하는 것이 가장 이상적인 그림이기 때문에 아래처럼 하는 방법이 궁극적으로는 더 좋다는 것
%>
<jsp:include page="include.jsp" flush="true">
<jsp:param name= "data" value="hello"/>
</jsp:include>
</body>
</html>