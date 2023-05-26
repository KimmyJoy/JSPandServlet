<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String[] names = {"���浿", "ȫ�浿", "���浿", "�ڱ浿", "��̿�"};
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("length", names.length);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- ������� �̷��� �� �����ϰ� ������ �ϰ�����
	${ names[0] }&nbsp;&nbsp;
	${ names[1] }&nbsp;&nbsp;
	${ names[2] }&nbsp;&nbsp;
	${ names[3] }&nbsp;&nbsp;
	${ names[4] }&nbsp;&nbsp;
--%>
<c:forEach begin="0" end="4" var="i">
	${ names[i] }&nbsp;&nbsp;
	<!-- 1. �� ������ ����� �𸣴� ��Ȳ���� ���� �Ұ����ѵ�? -->
</c:forEach>
<br>
	<!-- 2. ok �׷� �����ϸ� ��¡ -->
<c:forEach begin="0" end="${ length }" var="i">
	${ names[i] }&nbsp;&nbsp;
</c:forEach>
<br>
<!-- 3. �ٵ� �Ź� length ����°� ������ �׷��� ���� ���� �Լ� -->
<c:forEach begin="0" end="${ fn:length(names) }" var="i">
	${ names[i] }&nbsp;&nbsp;
</c:forEach>
<br>
<!-- ��������� names ���� �ϳ� �ϳ� ����ϰ��� �׸��� �װ� �����̶� �ϰ��� -->
<c:forEach items="${ names }" var="name">
	${ name }&nbsp;&nbsp;
</c:forEach>
<br>
<c:forEach items="${ names }" var="name">
      ${ name },&nbsp;
   </c:forEach>
   <br>
  <c:forEach items="${names}" var="name" varStatus="status">
   ${name}${not status.last ? ',' : ''}&nbsp;
</c:forEach>
  <br>
<%-- ���� �ʿ��� �ؼ��� �� �ϰ� ���ƿö� �ܼ� �ؽ�Ʈ�� ���ƿ��� ������
�̰� �����ϰ� f12�� �ҽ��� Ȯ���ϸ� ��ġ ���� ������ �� ����Ǿ��� �� ó�� ������ --%>
	�⵵���� : 
	<select>
		<c:forEach begin="1960" end="2023" var="year">
			<option>${ year }</option>
		</c:forEach>
	</select>
	<br>
<c:forEach begin="1" end="10" var="i">
	${ i }&nbsp;&nbsp;
</c:forEach>
</body>
</html>