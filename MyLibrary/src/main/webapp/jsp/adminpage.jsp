<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<!-- css 뒤에 javascript가 오는게 순서다 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script>
function loadPage(pageName) {
  $("#content").load("/MyLibrary/jsp/user/admin_view.jsp #" + pageName);
}
</script>
    <meta charset="UTF-8">
    <title>회원 관리 및 도서 관리</title>
    <style>
      body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
    }

    h2 {
      margin-bottom: 20px;
    }

    .button-container {
      display: flex;
      justify-content: space-between;
    }

    .button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      text-decoration: none;
      cursor: pointer;
    }

    /* 추가된 CSS 부분 */
    .container {
      display: flex;
    }

    .sidebar {
      width: 20%;
      padding-right: 20px;
      box-sizing: border-box;
    }

    #content {
      flex: 1;
    }
  </style>
</head>
<body>
<header>
  <jsp:include page="/jsp/include/topMenu.jsp"/>
  <jsp:include page="/jsp/include/searchbar.jsp"/>
</header>
<div class="container">
  <aside class="col-md-3 sidebar">
    <jsp:include page="/jsp/include/sidebar_admin.jsp" />
  </aside>
  <div id="content" class="col-9">
    <!-- 로드될 페이지 내용 -->
  </div>
</div>
<footer>
  <jsp:include page="/jsp/include/bottom.jsp"/>
</footer>
</body>
</html>