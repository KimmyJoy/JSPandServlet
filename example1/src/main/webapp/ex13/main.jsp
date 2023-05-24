<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 저 코드를 읽는 애는 java compiler를 가동하는 애는 tomcat임  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:out value = "hello World!!"/>
<!-- c:로 쓰는 이유 -> 코어태그?라서 jstl 중에서도 coretag라서 c를 쓰는 것 내 그지같은 코드를 볼 사람들에게 이 뒤에 나오는 애들이 core 태그 입니다를 알려주는 것  -->
<c:set var="price" scope="page" value="1000"/>
${price}
<!-- 위처럼 el과 혼용 사용 가능  -->
<!-- 같은 곳에서 분화된 것이라 입출력부분의 기능은 거의 동일하게 가져감 -->
<c:if test = "${price > 500}">
<c:out value="biggest!!"/>
</c:if>
<c:remove var= "price"/>
<!-- 변수를 한두개 선언할때엔 괜찮지만
여러개 있으면 오버플로우 같은 오류가 발생할 수 있어서 사용하고 지우기 위해 
remove를 사용한다 같은 의미로 쿠키나 세션쪽에서도 timeout 시간을 정해두고 사용하는게 좋다
시간이 지나면 자동으로 없어지도록 -->

<c:choose>
	<c:when test ="${price <= 1000}">
	<c:out value="low"/>
	</c:when>
	<c:when test ="${price > 1000}">
	<c:out value="big"/>
	</c:when>
	<c:otherwise>
	<c:out value="others"/>
	</c:otherwise>
	</c:choose>
	
</body>
</html>