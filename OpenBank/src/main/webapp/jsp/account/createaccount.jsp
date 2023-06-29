<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
</head>
<body>
<h2>Create a New Account</h2>
<form action="/OpenBank/createaccount.do" method="post"> 
    <label for="acc_nm">Account Name:</label><br>
    <input type="text" id="acc_nm" name="acc_nm"><br>
    <label for="acc_pw">Account Password:</label><br>
    <input type="password" id="acc_pw" name="acc_pw"><br>
    <input type="submit" value="Create Account">
</form>
</body>
</html>
