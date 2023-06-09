<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- css 뒤에 javascript가 오는게 순서다 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
<header>
<jsp:include page="/jsp/include/topMenu.jsp"/>
<jsp:include page="/jsp/include/searchbar.jsp"/>
</header>
<section id="main">
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