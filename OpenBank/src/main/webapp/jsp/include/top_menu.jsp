<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/OpenBank/src/main/webapp/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
  .header-custom {
    background-color: rgb(62,76,141);
  }

  .nav-link {
    color: white !important;
  }

  .btn-outline-light {
    color: white;
    border-color: white;
  }

  .btn-outline-light:hover {
    background-color: gray;
    color: white;
  }

  .btn-warning:hover {
    background-color: dark-gray;
    border-color: dark-gray;
  }
</style>

<header class="p-3 text-white header-custom">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
          <use xlink:href="#bootstrap"></use>
        </svg>
      </a>
      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 text-secondary">비대면 계좌 계설</a></li>
        <li><a href="#" class="nav-link px-2 text-white">계좌 이체</a></li>
        <li><a href="#" class="nav-link px-2 text-white">거래 내역 조회</a></li>
        <li><a href="#" class="nav-link px-2 text-white">FAQ</a></li>
        <li><a href="#" class="nav-link px-2 text-white"><c:if test="${loginUser.role eq '0' }">회원 관리</c:if></a></li>
        <li><a href="#" class="nav-link px-2 text-white"><c:if test="${loginUser.role eq '1' }">마이페이지</c:if></a></li>
      </ul>
      <div class="col-md-3 text-end navbar-right justify-content-between">
        <c:choose>
          <c:when test="${ not empty loginUser }">
            <button type="button" class="btn btn-outline-light me-2" onclick="location.href='logout.do'">로그아웃</button>
          </c:when>
          <c:otherwise>
            <button type="button" class="btn btn-warning" onclick="location.href='insertuser.do'">회원 가입</button>
            <button type="button" class="btn btn-outline-light me-2" onclick="location.href='login.do'">로그인</button>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</header>


<%--     <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
            <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>
        </div>

        <nav class="nav col-12 col-md-auto mb-2 justify-content-left mb-md-0">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="main.do">홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">이용 안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminpage.do"><c:if test="${loginUser.role eq 'S' }">도서 및 회원 관리</c:if></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Mypage.do"><c:if test="${loginUser.role eq 'U' }">마이페이지</c:if></a>
                </li>
            </ul>
        </nav>

        <div class="col-md-3 text-end navbar-right justify-content-between">
            <c:choose>
                <c:when test="${ not empty loginUser }">
                    <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='logout.do'">로그아웃</button>
                </c:when>
                <c:otherwise>
                  <button type="button" class="btn btn-primary me-1" onclick="location.href='insertuser.do'">회원 가입</button>
          		  <button type="button" class="btn btn-outline-primary" onclick="location.href='login.do'">로그인</button>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
</div>
<header class="p-3 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
          <li><a href="#" class="nav-link px-2 text-white">About</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>

        <div class="text-end">
          <button type="button" class="btn btn-outline-light me-2">Login</button>
          <button type="button" class="btn btn-warning">Sign-up</button>
        </div>
      </div>
    </div>
  </header> --%>