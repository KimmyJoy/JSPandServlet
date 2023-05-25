<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String[] nameArray = {"홍길동", "강길동", "고길동"};
	/* el을 하려면 무조건 공유해주는게 필요함 */
	pageContext.setAttribute("names", nameArray);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	첫번째 이름 : <%= nameArray[0] %><br>
	첫번째 이름 : <%= ((String[])pageContext.getAttribute("names"))[0] %><br>
	EL 첫번째 이름 : ${ names[0] }<br>
	<%-- 배열의 첫번째 이름 값을 가져오겠다는 이야기 --%>
	EL 네번째 이름 : ${ names[4] }
	<%-- 없는 값을 불러도 서버 오류가 나지 않고 empty 처리 됨 그게 장점 --%>
</body>
</html>