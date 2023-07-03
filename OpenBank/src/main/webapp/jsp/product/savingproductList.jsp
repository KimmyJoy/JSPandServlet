<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예금 상품 목록</title>
    <!-- Favicons -->
<link href="${ pageContext.request.contextPath }/jsp/assets/img/favicon.png" rel="icon">
<link href="${ pageContext.request.contextPath }/jsp/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${ pageContext.request.contextPath }/jsp/assets/css/style.css" rel="stylesheet">
</head>
<body>
<header>
<jsp:include page="../top_menu.jsp"></jsp:include>
</header>
<div class="container">
    <h1>예금 상품 목록</h1>
    <table id="productlist" class="table">
    <thead>
        <tr>
            <th>상품 코드</th>
            <th>상품명</th>
            <th>상품 유형</th>
            <th>이율</th>
            <th>최소 예치 금액</th>
            <th>상품 설명</th>
            <th>매월 예치 금액</th>
            <th>만기일</th>
            <th></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.p_cd}</td>
                <td>${product.p_nm}</td>
                <td>${product.p_type}</td>
                <td>${product.p_rate}</td>
                <td>${product.p_min_deposit}</td>
                <td>${product.p_description}</td>
                <td>${product.monthly_deposit}</td>
                <td>${product.maturity_date}</td>
                <td><button onclick="editProduct('${product.p_cd}')">수정</button></td>
                <td><button onclick="deleteProduct('${product.p_cd}')">삭제</button></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
< <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<!-- Vendor JS Files -->
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/aos/aos.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${ pageContext.request.contextPath }/jsp/assets/js/main.js"></script>
	
	
</body>
</html>




