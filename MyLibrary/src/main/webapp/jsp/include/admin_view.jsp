<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 도서 관리 페이지 -->
<div id="book_management" class="page">
  <!-- 도서 관리 페이지 내용 -->
  <h2>도서 관리 페이지</h2>
  <jsp:include page="/jsp/include/searchbar.jsp"/>
  <div class="btn-group">
    <button type="button" class="btn btn-success" data-toggle="modal"
        data-target="#addNewBook" aria-expanded="false">신규도서 등록</button>
</div>
<div class="btn-group">
    <button type="button" class="btn btn-success" data-toggle="modal"
        data-target="#deleteBook" aria-expanded="false">삭제</button>
</div>
  <jsp:include page="/jsp/include/booklist.jsp"/>
</div>

<!-- 게시판 관리 페이지 -->
<div id="board_management" class="page">
  <!-- 게시판 관리 페이지 내용 -->
  <h2>게시판 관리 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>

<!-- 회원 관리 페이지 -->
<div id="member_management" class="page">
  <!-- 회원 관리 페이지 내용 -->
  <h2>회원 관리 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>

<!-- 정보 수정 페이지 -->
<div id="profile" class="page">
  <!-- 정보 수정 페이지 내용 -->
  <h2>정보 수정 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>

<!-- 문의하기 페이지 -->
<div id="inquiry" class="page">
  <!-- 문의하기 페이지 내용 -->
  <h2>문의하기 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>