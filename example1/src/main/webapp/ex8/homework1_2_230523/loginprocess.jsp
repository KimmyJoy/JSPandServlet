<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>

<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");

    // 1. txt 파일에서 저장된 ID/PW 정보를 검색
      String filePath = getServletContext().getRealPath("/WEB-INF/IDPW.txt");

    BufferedReader reader = null;
    boolean found = false;
    
    try {
        reader = new BufferedReader(new FileReader(filePath));
        String line;
        
        // 파일을 한 줄씩 읽어오면서 ID와 비밀번호를 비교
        while ((line = reader.readLine()) != null) {
            String[] data = line.split(",");
            String savedId = data[0].trim();
            String savedPassword = data[1].trim();
            
            // 입력한 ID와 비밀번호와 저장된 ID와 비밀번호를 비교
            if (id.equals(savedId) && password.equals(savedPassword)) {
                found = true;
                break;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (reader != null) {
            try {
                reader.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    if (found) {
        // 2. 등록된 사용자면 메인 서비스 페이지로 이동
        session.setAttribute("id", id);
        response.sendRedirect("main.jsp");
    } else {
        // 3. 등록되지 않은 사용자면 오류 페이지로 이동
        response.sendRedirect("error.jsp");
    }

    %>
