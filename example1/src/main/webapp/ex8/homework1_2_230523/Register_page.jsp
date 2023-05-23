<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Register Page</title>
</head>
<body>
 <h1>Register</h1>
    <form action="registerprocess.jsp" method="post">
        <label for="id">ID:</label>
        <input type="text" name="id" id="id">
        <br>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password">
        <br>
        <label for="email">Email:</label>
        <input type="text" name="email" id="email">
        <br>
        <input type="submit" value="Register">
    </form>
</body>
</html>