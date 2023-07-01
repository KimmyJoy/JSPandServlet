<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Favicons -->
<link href="${ pageContext.request.contextPath }/jsp/assets/img/favicon.png" rel="icon">
<link href="${ pageContext.request.contextPath }/jsp/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="${ pageContext.request.contextPath }/jsp/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${ pageContext.request.contextPath }/jsp/assets/css/style.css" rel="stylesheet">
    <div class="container d-flex align-items-center justify-content-between">
      <div class="logo">
        <h1><a href="${ pageContext.request.contextPath }/jsp/index.jsp"><img src="${ pageContext.request.contextPath }/jsp/assets/img/logo_bank_230629.png" alt=""></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>
      <nav id="navbar" class="navbar">
        <ul>
        <li><a class="nav-link scrollto" href="#">님 환영합니다</a></li>
          <li><a class="nav-link scrollto active" href="#testimonials">About</a></li>
          <li><a class="nav-link scrollto" id="createAccountLink"href="#">비대면 계좌 개설</a></li>
          <li class="dropdown">
          <a href="#"><span>계좌 거래</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#"><span>계좌 이체</span></a></li>
              <li><a href="#">거래 내역</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="/OpenBank/jsp/product/product.jsp">금융상품</a></li>
          <li><a class="nav-link scrollto" href="#">오픈 뱅킹</a></li>
          <li><a class="nav-link scrollto" href="faqpage.jsp">Q & A</a></li>
          <li><a class="nav-link scrollto" href="mypage.do"><c:if test="${loginUser.u_role eq '1' }">마이페이지</c:if></a></li>
          <c:if test="${loginUser.u_role eq '0' }">
          <li class="dropdown">
    		<a href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
     			 <span id="adminLink" style="cursor: pointer;">관리자페이지</span><i class="bi bi-chevron-down"></i>
   			 </a>
    		<ul class="dropdown-menu" aria-labelledby="adminDropdown">
      			<li><a class="dropdown-item" href="#">문의 관리</a></li>
     			<li><a class="dropdown-item" href="#">상품 관리</a></li>
      			<li><a class="dropdown-item" href="#">회원 관리</a></li>
  			 </ul>
 		 </li>
		</c:if>
          <li>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <!-- <form>
              <input type="button" value="로그인" onclick="location.href='loginform.jsp'"> -->
              <c:choose>
                <c:when test="${ not empty loginUser }">
                    <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='/OpenBank/logout.do'">로그아웃</button>
                </c:when>
                <c:otherwise>
					<c:if test="${loginUser.role eq '0' }">
					<button type="button" class="btn btn-primary me-1" onclick="location.href='/OpenBank/joinuser.do'">회원 등록</button>
					</c:if>
 					<button type="button" class="btn btn-primary me-1" onclick="location.href='/OpenBank/joinuser.do'">회원 가입</button>
          		  <button type="button" class="btn btn-outline-primary" id="myBtn">로그인</button>
                </c:otherwise>
            </c:choose>
           <!--  </form> -->
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  
  
  
  <!-- The Modal -->
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>로그인</h2>
    <form method="post" action="" name="loginForm">
      <div class="mb-3">
        <label for="id" class="form-label">ID</label> 
        <input type="text" class="form-control" id="id" name="id" placeholder="대소문자 영문 5자리">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label> 
        <input type="password" class="form-control" id="password" name="password" placeholder="영문 대소문자 및 숫자 4자리 이상">
      </div>
      <button type="submit" class="btn btn-primary" id="loginSubmit">로그인</button>
    </form>
  </div>
</div>



    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<!-- Vendor JS Files -->
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/aos/aos.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${ pageContext.request.contextPath }/jsp/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${ pageContext.request.contextPath }/jsp/assets/js/main.js"></script>
	
	<!-- 로그인 모달용 스크립트 -->
	<script>
//특이점: 모달의 경우 팝업 시 중앙에 위치하기 위해서는 css가 script 상에 위치해있어야한다
// 모달가져오기
var modal = document.getElementById('myModal');

// 모달을 가져오기 위해 사용되는 버튼 링크(id를 통해서)
var btn = document.getElementById('myBtn');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName('close')[0];

// 연계된 버튼 클릭 시 모달창 보여주기
btn.onclick = function() {
	  modal.style.display = "block";
}

// 사용자가 x 버튼 클릭 시 모달창 비활성화
span.onclick = function() {
  modal.style.display = "none";
}

// 사용자가 다른 부분을 클릭 시 모달창 비활성화
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function validateLoginForm() {
	  var id = document.getElementById("id").value;
	  var password = document.getElementById("password").value;
	  
	  $.ajax({
	    url: '/OpenBank/loginprocess.do',
	    type: 'POST',
	    data: {
	      id: id,
	      password: password
	    },
	    success: function(data) {
	      if(data.success) {
	        alert("로그인 성공");
	        location.reload()//모달 창 상에서는 ${ loginUser.u_id }를 해도 정보를 모르는 상태여서 팝업에 띄워줄 수가 없다
	      } else {
	    	  alert("로그인 실패: " + data.message);
	      }
	    },
	    error: function(xhr, status, error) {
	    	alert("에러 발생: " + error);
	    },
	    dataType: 'json'
	  });
	}
//하단에 getElementByID는 로그인 입력창의 버튼과 매칭되므로 그쪽에 id로 loginSubmit 값을 입력해줘야함. 제대로 되지 않으면 addEventListener 오류가 발생하게 됨
	document.getElementById("loginSubmit").addEventListener("click", function(event){
	  event.preventDefault();
	  validateLoginForm();
	});
</script>
	<script>
  $(document).ready(function() {
    var loggedIn = ${not empty loginUser};
    var contextPath = '${ pageContext.request.contextPath }';
    
    $('#createAccountLink').on('click', function(e) {
      e.preventDefault();
      
      if (loggedIn) {
        // 로그인 상태일 경우 계좌 개설 페이지로 이동
        location.href = contextPath + '/jsp/account/createaccount.jsp';
      } else {
        // 비로그인 상태일 경우 로그인 모달 팝업
        $('#myBtn').click();
      }
    });

    $('#adminLink').on('click', function() {
	  window.location.href = contextPath + '/jsp/user/adminpage.jsp';
	});
  });
</script>
