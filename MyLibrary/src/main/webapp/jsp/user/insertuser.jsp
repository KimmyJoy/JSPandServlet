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
<h1>
<c:if test="${loginUser.role eq 'U' }">
회원 가입
</c:if>
<c:if test="${loginUser.role eq 'U' }">
회원 등록
</c:if>
</h1>
<hr/>
<!-- 만약 서로 연관성이 있는 것들이 있다면 어느정도로 연관성 있게 이름을 지어야 좋음 -->
<form action="insertuserprocess.do" method="post">
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
			<td><input type="text" name="name" placeholder="클로빵미"/>
		</tr>
		<tr>
			<td>휴대 전화 번호</td>
			<td><input type="text" name="phonenum" maxlength="13" placeholder="01011112222"/>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name="email"/>
		</tr>
		<c:if test="${loginUser.role eq 'S' }"><tr>
			<td>권한</td>
			<td><input type="radio" name="role" value="S" checked="checked"/>관리자
			<td><input type="radio" name="role" value="U"/>사용자
		</tr>
			</c:if>
		<tr>
			<td colspan="2">
			<input type="submit" value="제출"/>
		</tr>
	</table>
</form>
<br/>
<a href="login.do">로그인</a>
</body>
</html>