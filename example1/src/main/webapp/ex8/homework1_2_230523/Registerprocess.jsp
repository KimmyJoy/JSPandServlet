<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String email = request.getParameter("email");

    // 1. 등록 정보를 파일에 저장
    java.nio.file.Path filePath = java.nio.file.Paths.get("/example1/src/main/java/ex6/IDPW.txt"); // 파일 경로를 실제 경로로 변경해야 합니다.
    String data = id + "," + password + "," + email + "\n";

    try {
        java.nio.file.Files.write(filePath, data.getBytes(), java.nio.file.StandardOpenOption.CREATE, java.nio.file.StandardOpenOption.APPEND);
        // 파일에 데이터를 추가합니다.
        response.sendRedirect("login.jsp"); // 등록 후 로그인 페이지로 이동합니다.
    } catch (java.io.IOException e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp"); // 등록 중 오류가 발생하면 에러 페이지로 이동합니다.
    }
%>
