<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
</head>
<body>
<h2>Create a New Account</h2>
<form action="/OpenBank/createaccount.do" method="post"> 
    <label for="acc_nm">Account Name:</label><br>
    <input type="text" id="acc_nm" name="acc_nm"><br>
    <label for="acc_pw">Account Password:</label><br>
    <input type="password" id="acc_pw" name="acc_pw"><br>
    <input type="submit" value="Create Account">
</form>
<script>
    // 휴면 계좌 여부 확인 및 팝업 모달 띄우기
    $(document).ready(function() {
        var hasDormantAccounts = ${dormantAccount};

        if (hasDormantAccounts) {
            // 휴면 계좌가 있는 경우 모달 팝업 띄우기
            var confirmModal = confirm("현재 휴면 상태인 계좌가 있습니다. 휴면 해지 요청을 할까요?");
            if (confirmModal) {
                // 사용자가 휴면 해지 요청을 수락한 경우 처리할 로직 작성
                // 예를 들어, 휴면 해지 요청을 처리하는 함수 호출 등
            } else {
                // 사용자가 휴면 해지 요청을 거부한 경우 처리할 로직 작성
                // 예를 들어, 다른 동작 수행하거나 팝업을 닫는 등
            }
        }
    });
</script>
</body>
</html>
