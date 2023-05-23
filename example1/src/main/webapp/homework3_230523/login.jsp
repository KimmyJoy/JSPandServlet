<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Login Page</title>
<style>
body {
font-family: 'Nanum Gothic', sans-serif;
text-align: center;
color: #9c63bb;
}
</style>
<script>
	function validateForm() {
		const id = document.getElementById("id").value;
		const password = document.getElementById("password").value;
		//받는 값들은 const나 let으로 처리하는게 정신건강에 좋다 특히 id/pw는....
		if (id.trim() === '' || password.trim() === '') {
			alert("ID와 비밀번호를 모두 입력해주세요.");
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<%
	//세션에서 로그인 된 사용자의 ID 정보를 가져옴
	String loggedInId = (String) session.getAttribute("id");

	// 만약 로그인 정보가 있을 경우 바로 메인 페이지로 이동
	if (loggedInId != null) {
    response.sendRedirect("main.jsp");
 	// 로그인 정보가 없다면 로그인 할 수 있도록 로그인 화면을 보여줌
	} else {
    String loginUrl = request.getContextPath() + "/LoginServlet";
%>
	<h1>Login</h1>
	<form method="post" action="../LoginServlet"
		onsubmit="return validateForm()">
		<label for="id">ID:</label> <input type="text" name="id" id="id">
		<br> <label for="password">Password:</label>
		<input type="password" name="password" id="password"> <br> 
			<input type="submit" value="Login">
	</form>
	<% 
	}
	%>
</body>
</html>
