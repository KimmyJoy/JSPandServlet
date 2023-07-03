<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예금 상품 목록</title>
</head>
<body>
<header>
<jsp:include page="../top_menu.jsp"></jsp:include>
</header>
<div class="container">
<table id="productlist" class="table">
    <thead>
        <tr>
            <th>상품 코드</th>
            <th>상품명</th>
            <th>상품 유형</th>
            <th>이율</th>
            <th>최소 예치 금액</th>
            <th>상품 설명</th>
            <th>예금기간</th>
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
                <td>${product.p_d_term}</td>
                <td><button onclick="editProduct('${product.p_cd}')">수정</button></td>
                <td><button onclick="deleteProduct('${product.p_cd}')">삭제</button></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>