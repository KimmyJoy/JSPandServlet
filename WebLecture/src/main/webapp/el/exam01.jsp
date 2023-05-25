<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- jsp는 서블릿 그래서 서블릿 코드 없으면 h?d? 서블릿이라는 애를 상속받아서 씀?
sd버전에서는 실제 버전에서는 못 쓸 수 있음 tomcat서버에서 직접 lib에서 붙여서 써야함 
io를 가져와서 쓰는 법....서블릿에서 다 상속을 받아서 쓰고 있던 것(위에 있던 import) 이게 너무 귀찮아서 안쓰기 시작함 너무 함께 넣어야하는
규칙이 너무나도 많았음 그래서 ASP를 쓰기 시작함 그걸 해소하기 위해서 jsp가 만들어짐 .jsp이기만 하면 쓸 수 있도록 만들게 됨
근데 실제 jsp의 화면은 tomcat 서버에서 jsp를 누군가가 요청을 해야 패스를 찾은 후 exam.jsp을 찾는데 문제는 보여줄때 이게 있는 servlet을 찾아야 얘가 jsp를 서블릿화해서 보여줄 수 있음
그래서 로딩이 겁나 느림 jsp 엔진이 서블릿이 있나 없나를 서칭하기 위해 
컨텐트 주석(현재 이것이 쓰인 주석)은 클라이언트에게 보이고 브라우저에서는 f12 하면 보이는 것임 화면에서만 안보임
-->
	Hello!!
	<br>
	<%--
	jsp에서 서블릿을 거쳐 갈때면 보이지 않는 주석임 그래서 개발자는 반드시 jsp 주석을 써야함
	  http://localhost:8080/WebLecture/el/exam01.jsp?name=hong 입력시 hong을 출력하고 싶음
	  http://localhost:8080/WebLecture/el/exam01.jsp?name=hong&id=kkk
	 --%>
	
	이름 : <%= request.getParameter("name") %><br/>
	이름 : ${ param.name } <br>
	ID : ${ param.id }
</body>
</html>