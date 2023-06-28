<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
      <div class="logo">
        <h1><a href="main.do"><img src="${ pageContext.request.contextPath }/jsp/assets/img/joylogo.png" alt=""></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#testimonials">About</a></li>
          <li><a class="nav-link scrollto" href="#about">비대면 계좌 개설</a></li>
          <li class="dropdown"><a href="#"><span>계좌 이체</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">게시판</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                </ul>
              </li>
              <li><a href="#">거래 내역</a></li>
              <li><a href="#">계좌 이체</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#">금융상품</a></li>
          <li><a class="nav-link scrollto" href="#">오픈 뱅킹</a></li>
          <li><a class="nav-link scrollto" href="faqpage.jsp">Q & A</a></li>
          <li><a class="nav-link scrollto" href="mypage.do"><c:if test="${loginUser.u_role eq '1' }">마이페이지</c:if></a></li>
          <c:if test="${loginUser.u_role eq '0' }">
          <li><a class="dropdown" href="admin.do"><span>관리자페이지</span><i class="bi bi-chevron-down"></i></a></li>
          	<ul>
              <li><a href="#">게시판</a></li>
              <li><a href="#">거래 내역</a></li>
              <li><a href="#">계좌 이체</a></li>
            </ul>
            </c:if>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <li>
            <!-- <form>
              <input type="button" value="로그인" onclick="location.href='loginform.jsp'"> -->
              <c:choose>
                <c:when test="${ not empty loginUser }">
                    <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='/OpenBank/logout.do'">로그아웃</button>
                </c:when>
                <c:otherwise>
                  <button type="button" class="btn btn-primary me-1" onclick="location.href='/OpenBank/insertuser.do'">회원 가입</button>
          		  <button type="button" class="btn btn-outline-primary" id="myBtn">로그인</button>
                </c:otherwise>
            </c:choose>
           <!--  </form> -->
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->
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