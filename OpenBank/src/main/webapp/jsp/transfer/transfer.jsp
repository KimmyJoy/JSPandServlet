<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<jsp:include page="../top_menu.jsp"></jsp:include>
</header>
<form action="/transfer" method="post">
  <div>
    <label>From Account: </label>
    <input type="text" name="fromAccount">
  </div>
  <div>
    <label>To Account: </label>
    <input type="text" name="toAccount">
  </div>
  <div>
    <label>Amount: </label>
    <input type="text" name="amount">
  </div>
  <div>
    <label>Transaction Type: </label>
    <select name="tranType">
      <option value="출금">출금</option>
      <option value="입금">입금</option>
    </select>
  </div>
  <div>
    <input type="submit" value="Transfer">
  </div>
</form>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>