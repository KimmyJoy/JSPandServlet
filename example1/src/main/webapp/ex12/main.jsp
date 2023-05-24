<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <!-- java.util을 전부 다 쓰겠다는 소리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<!-- el은 일단 한번 컴파일을 하고 실행된다 
그래서 정수형은 정수형대로 들어가고 부동소수점형은 부동소수점 형으로 다 들어감 -->
<body>
<%
//맵타입은 원래 맵에 들어있는 값을 어떤 곳에 넣고 그 애를 불러와야하는데 여기서는 그냥 맵에서 바로 빼올 수 있어서 좋음
Map<String, String> map = new HashMap<>();
map.put("one", "hello");
map.put("two", "World");
/* map.put("3", "c");
String a = map.get("1"); */
pageContext.setAttribute("map", map);
//pageContext는 메모리라고 생각하면 됨 page와 page 간의 정보 공유를 위한 것들 : 쿠키(브라우저에 생성됨)/세션(서버에 생성됨)
//덧붙여 page 안에서만 생성되어야 하는 것들이 있는데 이게 pageContext 얘는 다른 페이지로 이동 되는 순간 사라짐
//application 메모리는 쿠키/세션보다도 더 오래 보관이 됨
%>
<%-- map[1] : <%= a %><br/>
${map["1"]}<br/>
${10 + 20}<br/>
<!-- 저 내부에서 전부 컴파일 되면서 계산한 값이 웹페이지에 출력되게 됨 -->
${true&&false}<br/>
<!-- 이 시행 결과 웹페이지에는 a가 뜬다 --> --%>
${map.get("one")}, ${map["one"]}, ${map.one}

${(10*10) ne 100} <br/>
${pageContext.request.contextPath}<br/>
</body>
</html>