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
<h1>게시글 목록</h1>
<hr/>
<h3>${user.name}님 환영합니다.<a href="logout.do">logout</a></h3>
<table border="1">
<tr>
<td>No.</td><td>TITLE</td><td>WRITER</td><td>DATE</td><td>HIT</td>
</tr>
<c:forEach var="board" items="${boardList}">
<tr>
<td>${board.seq}</td><td><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td><td>${board.writer}</td><td>${board.regDate}</td><td>${board.hit}</td>
<!-- 하이퍼링크로 보내면 get방식으로 전달이 됨 -->
</tr>
</c:forEach>
</table>
<h4><a href="insertBoard.html">글쓰기</a></h4>
<hr/>
<br/>
<form action="searchBoard.do" method="post">
<table>
<tr>
<td>
<input type="text" name="writer"/>
</td>
<td>
<input type="submit" value="검색"/>
</td>
</tr>
</table>
</form>
</body>
</html>