<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Account Details</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        h1 {
            margin-top: 50px;
        }
        p {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>계좌 개설 완료</h1>
    <p>${user_id}님의 계좌가 정상적으로 개설되었습니다.</p>
    <p>계좌 정보:</p>
    <p>계좌 이름: ${account.acc_nm}</p>
    <p>계좌 번호: ${account.acc_no}</p>
    <p>은행 코드: ${account.bank_cd}</p>
    <p>계좌 잔액: ${account.acc_bal}</p>
    <p>이자율: ${account.rate}</p>
</body>
</html>
