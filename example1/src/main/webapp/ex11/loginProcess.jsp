<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="ex10.LoginBean" />
   <jsp:setProperty name="login" property="id" />
   <jsp:setProperty name="login" property="password" />
   <%
   String id = request.getParameter("id");
   String password = request.getParameter("password");

   if (login.dbCheck()) {
	   //아래 있는 코드는 jsp에서는 이후에는 bean이 점점 더 커짐(도서관프로젝트를 생각해볼때 도서관에서 만들 클래스들을 bean으로 생성해서 불러넣고 부르는게 더 빠르다)
	   //도서관에서도 dao는 건드리지 않고, jsp와 servlet만 login만 서로 빼고, servlet에서 체크인할때 dao에서 체크해서 빼오면 됨???
      Cookie idCookie = new Cookie("id", id);
      Cookie passwordCookie = new Cookie("password", password);

      session.setAttribute("id", id);
      session.setAttribute("password", password);

      idCookie.setMaxAge(3600);
      passwordCookie.setMaxAge(3600);

      response.addCookie(idCookie);
      response.addCookie(passwordCookie);

      response.sendRedirect("mainPage.jsp");
   } else {
      response.sendRedirect("error.jsp");
   }
   %>
</body>
</html>
  