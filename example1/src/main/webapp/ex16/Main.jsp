<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="my" uri="http://myTag.com" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body {
color: royalblue;
}
</style>
</head>
<body>
<h1>tag ���� ����</h1>
<my:simple></my:simple>
<%-- ���⼭ my�� �츮�� ��ܿ��� prefix�� my�� �߱� ������ my�� ���°��̰�
simple�� ��� �츮�� tld�� ���� tld�� �̸��� simple�̶�� �ؼ� �׷��� ����ϴ� ���̴� --%>
<tf:Attr count="3">
world</br>
</tf:Attr>
</body>
</html>