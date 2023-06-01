<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>글 상세보기</h1>
<hr/>
<form action="updateBoard.do" method="post">
<input name="seq" type="hidden" value="${board.seq}"/>
<table border="1">
	<tr>
	<td>제목</td>
	<td><input type="text" name="title" value="${board.title}"/></td>
	</tr>
	<tr>
	<td>작성자</td>
	<td>${board.writer}</td>
	</tr>
	<tr>
	<td>글 내용</td>
	<td><textarea name="content" cols="40" rows="10">${board.content}</textarea></td>
	</tr>
	<tr>
	<td>작성 일자</td>
	<td>${board.regDate}</td>
	</tr>
	<tr>
	<td>조회수</td>
	<td><input type="text" name="hit" value="${board.hit}"/></td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="수정하기"/></td>
	</tr>
</table>
<br/>
<!-- 어드민한테만 삭제 버튼이 나오게 하는 법 -->
<c:if test="${user.role == 'Admin'}">
<a href="deleteBoard.do?seq=${board.seq}">삭제</a>
</c:if>
<a href="getBoardList.do">목록으로 돌아가기</a>
</form>
</body>
</html>