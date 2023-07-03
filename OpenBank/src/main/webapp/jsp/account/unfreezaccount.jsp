<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Account List</title>
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
<style>
     /*--------------------------------------------------------------
# Table
--------------------------------------------------------------*/
.table {
  width: 80%;
  margin-bottom: 1rem;
  color: #212529;
  box-shadow: 0 0 29px 0 rgba(68, 88, 144, 0.12);
  transition: all 0.3s ease-in-out;
  border-radius: 8px;
  background: #fff;
  z-index: 1;
}

.table-striped tbody tr:nth-of-type(odd) {
  background-color: rgba(68, 88, 144, 0.05);
}

.table-hover tbody tr:hover {
  color: #fff;
  background-color: #3498db;
}

.table-hover tbody tr:hover td,
.table-hover tbody tr:hover th {
  color: #fff;
}

.table thead th {
  vertical-align: bottom;
  border-bottom: 2px solid #dee2e6;
  color: #212529;
  font-weight: 700;
   width: 25%; 
}

.table td, .table th {
	text-align: center;
  padding: .75rem;
  vertical-align: top;
  border-top: 1px solid #dee2e6;
}

.input-group .form-control {
  position: relative;
  flex: 1 1 auto;
  width: 1%;
  min-width: 0;
  margin-bottom: 0;
  padding: .375rem .75rem;
  border: 1px solid #ced4da;
  border-radius: .25rem;
  transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.input-group-append .btn {
  position: relative;
  flex: 0 0 auto;
  margin-bottom: 0;
  text-align: center;
  white-space: nowrap;
  border: 1px solid #ced4da;
  padding: .375rem .75rem;
  border-radius: .25rem;
  font-size: 1rem;
  line-height: 1.5;
  background-color: #3498db;
  color: #fff;
  transition: background-color .15s ease-in-out, border-color .15s ease-in-out;
}

.input-group-append .btn:hover {
  background-color: #1877ac;
  border-color: #1877ac;
}

.unfreezeBtn {
  background-color: #3498db;
  border-color: #3498db;
  color: #fff;
  transition: background-color .15s ease-in-out, border-color .15s ease-in-out;
}

.unfreezeBtn:hover {
  background-color: #1877ac;
  border-color: #1877ac;
}
.fixed-width-input {
  width: 400px;
}
    </style>
</head>
<body>
<header>
<jsp:include page="../top_menu.jsp"></jsp:include>
</header>
<!-- id 검색창 -->
<div class="d-flex justify-content-center">
    <form action="/OpenBank/accList.do" method="post" class="input-group mb-3">
        <input type="text" name="u_id" placeholder="아이디 입력" class="form-control fixed-width-input">
        <div class="input-group-append">
            <button type="submit" class="btn btn-primary">검색</button>
        </div>
    </form>
</div>

<!-- 계좌 목록 테이블 -->
<table class="table table-striped table-hover">
    <thead class="thead-dark">
        <tr>
            <th>계좌 번호</th>
            <th>계좌 이름</th>
            <th>상태</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="account" items="${accounts}">
            <tr>
               <td>${account.acc_no}</td>
                <td>${account.acc_nm}</td>
                <td>
                    <c:choose>
                        <c:when test="${account.acc_stat eq 'N'}">정상 계좌</c:when>
                        <c:when test="${account.acc_stat eq 'n'}">정상 계좌</c:when>
                        <c:when test="${account.acc_stat eq 'U'}">휴면 계좌</c:when>
                        <c:when test="${account.acc_stat eq 'u'}">휴면 계좌</c:when>
                    </c:choose>
                </td>
                <td>
                    <button class="unfreezeBtn btn btn-primary" data-account="${account.acc_no}" data-status="${account.acc_stat}">휴면 해지</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- 계좌번호 입력창 -->
<div id="unfreezeInput" style="display: none;">
  <form id="unfreezeForm" action="/OpenBank/accStatUpdate.do" method="post" class="input-group mb-3">
        <input type="text" name="acc_no" placeholder="계좌번호 입력" class="form-control fixed-width-input">
        <div class="input-group-append">
            <button class="unfreezeConfirmBtn btn btn-primary" type="submit">확인</button>
        </div>
    </form>
</div>

<!-- JavaScript -->
<script>
    // 해지 버튼 클릭 시 계좌번호 입력창 표시
    var unfreezeBtns = document.getElementsByClassName('unfreezeBtn');
    for (var i = 0; i < unfreezeBtns.length; i++) {
        unfreezeBtns[i].addEventListener('click', function() {
            var accountNumber = this.getAttribute('data-account');
            var accountStatus = this.getAttribute('data-status');
            var unfreezeInput = document.getElementById('unfreezeInput');
            var unfreezeConfirmBtn = unfreezeInput.querySelector('.unfreezeConfirmBtn');
            
            document.querySelector('input[name="acc_no"]').value = accountNumber;
            
            // 계좌 상태에 따라 버튼 활성/비활성화 설정
            unfreezeConfirmBtn.disabled = accountStatus !== 'U';
            
            unfreezeInput.style.display = 'block';
        });
    }
</script>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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