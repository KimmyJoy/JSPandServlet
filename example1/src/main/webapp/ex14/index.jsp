<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var = "product" value="<b>Apple Iphone</b>"/>
<c:set var = "intArray" value="${[1, 2, 3, 4, 5]}"/>
<!-- jstl이 공식적으로 지원되지 않는 버전으로 톰캣을 사용하고 있어서 위에 $부분에서
빨간 줄이 뜨는 것 최신버전으로 가면 안뜨겠지만 이 경우 jdk 버전도 함께 올라가야한다-->
<c:forEach var = "num" varStatus="i" items="${intArray}">
${i.index} : ${num}<br/>
</c:forEach>
</body>
</html>