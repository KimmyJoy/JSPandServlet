<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- <link href="assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> -->
<!-- <script>
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
    </script> -->
<!-- <script>
$(document).ready(function() {
    $("form[name='loginForm']").on('submit', function(e) {
        e.preventDefault();  // 폼 제출 이벤트를 막아 페이지 리로드를 방지합니다.
        var id = $('#id').val();
        var password = $('#password').val();

        // AJAX 요청을 보냅니다.
        $.ajax({
            url: 'loginprocess.do',  // 서버로 요청을 보낼 URL입니다.
            type: 'POST',  // 요청 메서드입니다.
            data: {
                id: id,
                password: password
            },
            success: function(response) {
                // 서버로부터 응답을 받았을 때 실행할 함수입니다.
                if(response.success) {
                    // 로그인이 성공했다면 메인 페이지로 이동합니다.
                    location.href = 'index.jsp';
                } else {
                    // 로그인이 실패했다면 에러 메시지를 표시합니다.
                    alert(response.message);
                }
            },
            error: function() {
                // 요청이 실패했을 때 실행할 함수입니다.
                alert('An error occurred while processing your request.');
            }
        });
    });
});
</script> -->
</head>
<body>
    <header>
        <jsp:include page="top_menu.jsp"></jsp:include>
    </header>
    <section id="main">
        <div align="center" style="margin-top: 300px;">
            <h2>로그인</h2>
            <br>
            <div class="card" style="width: 18rem;">
          <form method="post" action="" name="loginForm">
                    <div class="mb-3">
                        <label for="id" class="form-label">ID</label> 
                        <input type="text" class="form-control" id="id" name="id">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label> 
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <button type="submit" class="btn btn-primary">로그인</button>
                </form>
            </div>
        </div>
    </section>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>