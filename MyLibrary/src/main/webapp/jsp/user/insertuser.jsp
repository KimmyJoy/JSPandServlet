<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-euiv="Content-Type" content= "text/html" charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 추가 등록</h1>
<hr/>
<!-- 만약 서로 연관성이 있는 것들이 있다면 어느정도로 연관성 있게 이름을 지어야 좋음 -->
<form action="insertUser.do" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"/>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"/>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"/>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name="email"/>
		</tr>
		<tr><c:if test="">
			<td>권한</td>
			<td><input type="radio" name="role" value="Admin" checked="checked"/>관리자
			<td><input type="radio" name="role" value="User"/>사용자
			</c:if>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="제출"/>
		</tr>
	</table>
</form>
<br/>
<a href="login.html">로그인</a>
</body>
</html>