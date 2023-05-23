<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 로그아웃 처리: 세션에서 id 속성 제거
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
