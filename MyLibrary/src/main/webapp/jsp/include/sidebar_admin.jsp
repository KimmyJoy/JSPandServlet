<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<div class="sidebar">
  <ul class="nav flex-column">
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('book_management')">도서 관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('board_management')">게시판 관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('member_management')">회원 관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('profile')">정보수정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('inquiry')">문의하기</a>
    </li>
  </ul>
</div>
