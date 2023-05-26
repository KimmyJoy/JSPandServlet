<%@page import="kr.ac.kopo.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	String type = rquest.
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 날아오는 파라미터(S,U)에 따라 다른 화면을 보여주고 싶음 
		http://localhost:8080/WebLecture/jstl/exam02_out.jsp?type=S
		요청시 관리자님 환영합니다 메세지 출력하고 싶음
		http://localhost:8080/WebLecture/jstl/exam02_out.jsp?type=U
		일반사용자님 환영합니다 메세지 출력하고 싶음
	 -->
<%-- 	 <% 쓰지 말아라 if 태그가 있으니까
	 	if(type.equals("S")){
	 %>
	 <h2>관리자님 환영합니다</h2>
	 <%
	 	} else {
	 %>
	  <h2>일반 사용자님 환영합니다</h2>
	 <% 
	 	}
		 %> --%>
	<%--	 <!-- if 태그를 사용한 방법 -->
		<c:if test="${ param.type == 'S' }">
			<h2>관리자님 환영합니다</h2>
		</c:if>
		<c:if test="${ param.type eq 'U' }">
		<!-- == 대신에 equals를 의미하는 eq를 쓸 수 있음 -->
			<h2>일반사용자님 환영합니다</h2>
		</c:if>
		--%>
		<!-- choose 태그를 이용한 방법 -->
		<c:choose>
			<c:when test="${ param.type == 'S' }">
				<h2>노예님 환영합니다!!!</h2>
			</c:when>
			<c:when test="${ param.type == 'U' }">
			<h2>일반사용자님 환영합니다!!!!</h2>
			</c:when>
			<c:otherwise>
			 <h2>아 좀 제대로 입력점</h2>
			</c:otherwise>
		</c:choose>
</body>
</html>