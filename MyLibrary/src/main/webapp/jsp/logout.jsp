<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<script>
alert('로그아웃되었습니다')
location.href = "/MyLibrary";
	 if(confirm('로그아웃하시겠습니까?')){
		session.invalidate();	
	}
	location.href = "/MyLibrary"; 
</script>