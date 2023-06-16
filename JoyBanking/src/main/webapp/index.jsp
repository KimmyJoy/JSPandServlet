<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
	<div>메인페이지....</div>
	<a href="${ pageContext.request.contextPath }/login.do">로그인</a>
	<a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a>
	</section>
	<%--상단에 주소로 들어가는 것이 유연하게 되었으면 좋겠음 그러기 위해서는
	-> EL을 활용해서 "${ pageContext.request.contextPath }/logout.do"로 씀
	 --%>
</body>
</html>