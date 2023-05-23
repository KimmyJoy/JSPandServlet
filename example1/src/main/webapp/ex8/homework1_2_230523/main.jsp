<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Service Page</title>
</head>
<body>
    <h1>Main Service</h1>
    <p>로그인 완료<br/><%= session.getAttribute("id") %>님 환영합니다🤑ヾ(•ω•`)/<a href="logout.jsp">Logout</a>
</body>
</html>
