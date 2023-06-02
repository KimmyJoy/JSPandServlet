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
<h1>tag 예제 시작</h1>
<my:simple></my:simple>
<%-- 여기서 my는 우리가 상단에서 prefix를 my로 했기 때문에 my를 쓰는것이고
simple의 경우 우리가 tld에 만든 tld의 이름을 simple이라고 해서 그렇게 사용하는 것이다 --%>
<tf:Attr count="3">
world</br>
</tf:Attr>
</body>
</html>