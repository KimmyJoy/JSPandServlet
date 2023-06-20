<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<!-- css 뒤에 javascript가 오는게 순서다 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
        var naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "ZRIKQjTFI1KJuVTjzRgg", // 네이버 개발자 센터에서 발급받은 클라이언트 ID
                callbackUrl: "http://localhost:8080/callback", // callback URL
                isPopup: false,
                callbackHandle: true,
            }
        );

        naverLogin.init();

        window.addEventListener('load', function () {
            naverLogin.getLoginStatus(function (status) {
                if (status) {
                    console.log(naverLogin.user.getId());
                } else {
                    console.log("AccessToken is not valid.");
                }
            });
        });
    </script>
<script>
 	function checkForm() {
		let f = document.loginForm;
		let id = f.id;
		let password = f.password;
		
		if(id.value.trim() === '') {
			alert('ID를 입력하세요')
			id.focus()
			return false;
		}
		if(password.value.trim() === ''){
			alert('패스워드를 입력하세요')
			password.focus()
			return false;
		}
		return true;
	 }
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/top_menu.jsp" />
		<jsp:include page="/jsp/include/searchbar.jsp"/>
	</header>
	<section id="main">
		<div align="right">
		<br>
		<h2>로그인</h2>
		<br>
		<div class="card" style="width: 18rem;">
		<form method="post" action="loginprocess.do" 
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
		<a id="kakao-login-btn" href="javascript:loginWithKakao()">
		<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="300" alt="카카오 로그인 버튼"/>
		</a>
		<p id="token-result"></p>
		</div>
		</div>
		 <div id="naverIdLogin"></div> <!-- 네이버 로그인 버튼이 위치할 div -->
		<div id="booklist-container"></div>
	</section>
	<section>
	</section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp" />
	</footer>
</body>
</html>