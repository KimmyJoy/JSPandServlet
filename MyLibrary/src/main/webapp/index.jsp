<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 도서관</title>
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<!-- css 뒤에 javascript가 오는게 순서다 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header>
<jsp:include page="/jsp/include/topMenu.jsp"/>
<jsp:include page="/jsp/include/searchbar.jsp"/>
</header>
<section id="main">
<div id="booklist-container"></div>
메인페이지입니다
</section>
<section>
</section>
<footer>
<jsp:include page="/jsp/include/bottom.jsp"/>
<!-- 지시자라고 함..< %요겅 근데 이걸 쓰면 여기에 쓰인 내용을 복사 붙여넣기 하는거라 많으면 많을수록 줄이 쓸데없이 많아질 수 있음 -->
</footer>
</body>
</html>