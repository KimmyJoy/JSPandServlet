<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        $('.dropdown').hover(function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
        }, function () {
            $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
        });
    });
</script>
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
            <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>
        </div>

        <nav class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <ul class="nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        자료 검색
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">통합검색</a></li>
                        <li><a class="dropdown-item" href="#">저자 검색</a></li>
                        <li><a class="dropdown-item" href="#">도서명 검색</a></li>
                        <li><a class="dropdown-item" href="#">ISBN 검색</a></li>
                    </ul>
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
                  <button type="button" class="btn btn-primary me-2">회원 가입</button>
          		  <button type="button" class="btn btn-outline-primary" onclick="location.href='login.do'">로그인</button>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
</div>

<%-- <table style="width:100%" border="1">
	<tr>
		<td rowspan="2"><img src ="/WebTest/img/logo.webp" width ="10%"></td>
		<td align="right">
			<span style="padding-right: 5px">즐겨찾기</span>
			<c:if test="${ not empty loginUser }">
			[${ loginUser.name }(${ loginUser.id })님 로그인중...]
			<!-- .은 겟 네임, 겟 아이디 메소드를 소환  -->
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${loginUser.role eq 'S' }">
			회원관리 | 
			</c:if>
			게시판 | 
			<c:choose>
			 <c:when test="${ empty loginUser }">
			회원가입 | 
			<a href="/MyLibrary/jsp/login.jsp">로그인</a>
			</c:when>
			<c:otherwise>
			마이페이지 |
				<a href="/MyLibrary/jsp/logout.jsp">로그아웃</a>
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table> 
<!-- 아래 두개는 로그인이 안되었을 때에만 보여야하고 -->
			<!-- forEach의 경우에는 회원목록 출력 할때나 쓰는 것 -->
			<!-- id 기억하기는 쿠키를 쓰는 거임 -->--%>
			 
