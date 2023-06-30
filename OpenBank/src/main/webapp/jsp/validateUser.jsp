<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>
<%
    // 유효성 검사를 위한 로직 수행
    // 검사 결과를 JSON 형식으로 생성
    // 예시로 유효성 검사를 수행하지 않고 모든 필드를 통과한 것으로 가정하고 JSON 결과 생성
    String jsonString = "{\"valid\": true, \"errors\": {}}";
    out.print(jsonString);
%>
