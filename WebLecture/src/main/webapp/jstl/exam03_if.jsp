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
	<!-- ���ƿ��� �Ķ����(S,U)�� ���� �ٸ� ȭ���� �����ְ� ���� 
		http://localhost:8080/WebLecture/jstl/exam02_out.jsp?type=S
		��û�� �����ڴ� ȯ���մϴ� �޼��� ����ϰ� ����
		http://localhost:8080/WebLecture/jstl/exam02_out.jsp?type=U
		�Ϲݻ���ڴ� ȯ���մϴ� �޼��� ����ϰ� ����
	 -->
<%-- 	 <% ���� ���ƶ� if �±װ� �����ϱ�
	 	if(type.equals("S")){
	 %>
	 <h2>�����ڴ� ȯ���մϴ�</h2>
	 <%
	 	} else {
	 %>
	  <h2>�Ϲ� ����ڴ� ȯ���մϴ�</h2>
	 <% 
	 	}
		 %> --%>
	<%--	 <!-- if �±׸� ����� ��� -->
		<c:if test="${ param.type == 'S' }">
			<h2>�����ڴ� ȯ���մϴ�</h2>
		</c:if>
		<c:if test="${ param.type eq 'U' }">
		<!-- == ��ſ� equals�� �ǹ��ϴ� eq�� �� �� ���� -->
			<h2>�Ϲݻ���ڴ� ȯ���մϴ�</h2>
		</c:if>
		--%>
		<!-- choose �±׸� �̿��� ��� -->
		<c:choose>
			<c:when test="${ param.type == 'S' }">
				<h2>�뿹�� ȯ���մϴ�!!!</h2>
			</c:when>
			<c:when test="${ param.type == 'U' }">
			<h2>�Ϲݻ���ڴ� ȯ���մϴ�!!!!</h2>
			</c:when>
			<c:otherwise>
			 <h2>�� �� ����� �Է���</h2>
			</c:otherwise>
		</c:choose>
</body>
</html>