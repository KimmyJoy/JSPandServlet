<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="validate.js"></script> <!-- AJAX 유효성 검사 스크립트 -->
</head>
<body>
    <form id="signup-form">
        <label for="u_id">ID:</label><br>
        <input type="text" id="u_id" name="u_id"><br>
        <label for="u_pw">Password:</label><br>
        <input type="password" id="u_pw" name="u_pw"><br>
        <label for="u_nm">이름:</label><br>
        <input type="text" id="u_nm" name="u_nm"><br>
        <label for="u_num">휴대전화번호:</label><br>
        <input type="text" id="u_num" name="u_num"><br>
        <label for="u_email">이메일:</label><br>
        <input type="text" id="u_email" name="u_email"><br>
        <label for="u_identy">주민등록번호:</label><br>
        <input type="text" id="u_identy" name="u_identy" onkeyup="addHyphen()"><br>
        <label for="u_add">주소:</label><br>
        <input type="text" id="u_add" name="u_add"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
