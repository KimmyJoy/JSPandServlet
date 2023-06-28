<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1><a href="index.jsp">Vesperr</a></h1>
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
              <li><a href="#">거래내역</a></li>
              <li><a href="#">계좌 이체</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#pricing">금융상품</a></li>
          <li><a class="nav-link scrollto" href="#contact">오픈 뱅킹</a></li>
          <li><a class="nav-link scrollto" href="#services">Q & A</a></li>
          <li><a class="nav-link scrollto" href="#team">마이페이지</a></li>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <li>
            <form>
              <input type="button" value="로그인" onclick="location.href='loginform.jsp'">
            </form>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->