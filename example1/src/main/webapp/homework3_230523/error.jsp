<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Error</title>
<style>
h1 {
	font-family: 'Nanum Gothic', sans-serif;
	text-align: center;
	color: #red;
}
body {
font-family: 'Nanum Gothic', sans-serif;
text-align: center;
}
</style>
<script>
	setTimeout(function() {
		window.location.href = "login.jsp";
	}, 5000); // 5초 후에 로그인 페이지로 이동
</script>
</head>
<body>
	<h1>Error</h1>
	<p>등록되지 않은 사용자입니다. 로그인 페이지로 이동 중입니다...</p>
</body>
</html>
