<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <div class="col-md-3 mb-2 mb-md-0">
        <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
          <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>
      </div>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-secondary">도서 관리</a></li>
        <li><a href="#" class="nav-link px-2">도서 삭제</a></li>
        <li><a href="#" class="nav-link px-2">게시판</a></li>
        <li><a href="#" class="nav-link px-2">About</a></li>
      </ul>
      <div class="col-md-3 text-end">
      <c:choose>
       <c:when test="${ empty loginUser }">
        <button type="button" class="btn btn-primary">관리자 추가 등록</button>
        </c:when>
        <c:otherwise>
        <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='logout.do'">로그아웃</button>
     	</c:otherwise>
			</c:choose>
      </div>
    </header>
  </div>