<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/WebTest/css/layout.css">
</head>
<body>
<header>
<jsp:include page="/jsp/include/topMenu.jsp" />
</header>
<section>
메인페이지입니다
</section>
<footer>
<%@ include file="/jsp/include/bottom.jsp" %>
<!-- 지시자라고 함..< %요겅 근데 이걸 쓰면 여기에 쓰인 내용을 복사 붙여넣기 하는거라 많으면 많을수록 줄이 쓸데없이 많아질 수 있음 -->
</footer>
</body>
</html>