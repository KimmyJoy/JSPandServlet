<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String[] names = {"강길동", "홍길동", "윤길동", "박길동", "김미연"};
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
<%-- 본래라면 이렇게 다 무식하게 찍었어야 하겠지만
	${ names[0] }&nbsp;&nbsp;
	${ names[1] }&nbsp;&nbsp;
	${ names[2] }&nbsp;&nbsp;
	${ names[3] }&nbsp;&nbsp;
	${ names[4] }&nbsp;&nbsp;
--%>
<c:forEach begin="0" end="4" var="i">
	${ names[i] }&nbsp;&nbsp;
	<!-- 1. 다 좋은데 몇개일지 모르는 상황에서 지정 불가능한디? -->
</c:forEach>
<br>
	<!-- 2. ok 그럼 렝스하면 되징 -->
<c:forEach begin="0" end="${ length }" var="i">
	${ names[i] }&nbsp;&nbsp;
</c:forEach>
<br>
<!-- 3. 근데 매번 length 만드는거 개구찮 그래서 나온 것이 함수 -->
<c:forEach begin="0" end="${ fn:length(names) }" var="i">
	${ names[i] }&nbsp;&nbsp;
</c:forEach>
<br>
<!-- 아이템즈로 names 값을 하나 하나 출력하겠음 그리고 그걸 네임이라 하겠음 -->
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
<%-- 서버 쪽에서 해석을 다 하고 날아올때 단순 텍스트로 날아오기 때문에
이걸 시행하고 f12로 소스를 확인하면 마치 내부 내용이 다 기재되었던 것 처럼 보여짐 --%>
	년도선택 : 
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