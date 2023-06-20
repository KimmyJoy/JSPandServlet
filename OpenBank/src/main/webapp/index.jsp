<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOY BANK</title>
<script></script>
 <%-- 인덱스를 .do로 시작하게 하기 위해서는 xml에서는 그대로 index.jsp를 기재하고 이쪽에서 forward를 하는 것이 필요하다 --%>
</head>
<body>
<header>
<jsp:include page="/jsp/include/top_menu.jsp"></jsp:include>
<jsp:include page="/jsp/include/searchbar.jsp"></jsp:include>
</header>
<section>
메인 페이지
</section>
<footer>
<jsp:include page="/jsp/include/bottom.jsp"></jsp:include>
</footer>
</body>
</html>