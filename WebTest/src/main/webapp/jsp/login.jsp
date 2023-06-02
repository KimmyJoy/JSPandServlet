<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap을 써서 로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/WebTest/css/layout.css">
<!-- css 뒤에 javascript가 오는게 순서다 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script>
 	function checkForm() {
 		/*
		let id = document.getElementById("id")
		if(id.value == '') {
			alert('ID를 입력하세요')
			id.focus()//이걸 쓰면 id란에 커서포인트가 깜박거림
			return false
		}
		
		return false//submit 버튼 눌렀을때
		*/
		
		let f = document.loginForm;
		let id = f.id;
		let password = f.password;
		
		if(f.id.value == '') {
			alert('ID를 입력하세요')
			f.id.focus()
			return false
		}
		if(f.password.value == ''){
			alert('패스워드를 입력하세요')
			f.password.focus()
			return false
		}
		return true
	 }
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="right">
		<br>
		<h2>로그인</h2>
		<br>
		<div class="card" style="width: 18rem;">
		<form method="post" action="loginprocess.jsp" 
			  name="loginForm" onsubmit="return checkForm()">
			<div class="form-group">
				<label for="id">ID</label> 
				<input type="text" class="form-control" id="id" name="id">
			</div>
			<div class="form-group">
				<label for="password">Password</label> 
				<input type="password" class="form-control" id="password" name="password">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
		</div>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
<!-- <header>

</header>
<body>
<h2>로그인</h2>
<br>
   <form method="post" action="loginprocess.jsp" 
   name="loginForm" onsubmit="return checkForm()">
 폼태그는 name 속성으로 바로 접근할 수 있음
  <div class="form-group">
 label은 input의 id에 대응하는 것이 for 옆에 기재됨
    <label for="id">ID</label>
    <input type="text" class="form-control" id="id" name="id">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" name="password">
  </div>
  <button type="submit" class="btn btn-primary">로그인</button>
</form>
</body> -->
</html>