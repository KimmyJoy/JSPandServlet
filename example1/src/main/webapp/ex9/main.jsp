<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setAttribute("name", "joy");
//include.jsp�� ����Ǹ鼭, name �ڸ��� joy�� data�� �Ķ���ͷδ� value�� ���޵�
//�ڹ� �ڵ� ���� �ϴ� ���� (<%) ���� �ϴ� ���� ���� �̻����� �׸��̱� ������ �Ʒ�ó�� �ϴ� ����� �ñ������δ� �� ���ٴ� ��
%>
<jsp:include page="include.jsp" flush="true">
<jsp:param name= "data" value="hello"/>
</jsp:include>
</body>
</html>