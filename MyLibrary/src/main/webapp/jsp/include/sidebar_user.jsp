<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<div class="sidebar">
  <ul class="nav flex-column">
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('changeinfo')">정보 수정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('my_board')">내가 쓴 글 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('getservice')">문의 하기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="javascript:void(0)" onclick="loadPage('byebye')">회원 탈퇴</a>
    </li>
  </ul>
</div>
