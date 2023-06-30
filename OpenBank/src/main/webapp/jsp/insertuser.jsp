<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#signup-container {
	display: absolute;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.joinform {
	border-collapse: collapse;
	margin: 5% auto;
}

.error {
	color: red;
	display: none;
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<header id="header" class="fixed-top d-flex align-items-center">
		<jsp:include page="top_menu.jsp"></jsp:include>
	</header>
	<section class="signup-container">
		<form action="insertuser.do" method="post" class="text-center"
			name="inputForm" id="signupForm" onsubmit="return checkSubmit()">
			<table class="joinform" border="1" style="">
				<tr>
					<td>아이디</td>
					<td><input type="text" id="u_id" name="u_id"
						placeholder="영대소문자 및 숫자"></td>
					<td><span id="u_id-error" class="error"></span></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="u_pw" name="u_pw"
						placeholder="영대소문자 및 특수문자 6자리 이상"></td>
					<td><span id="u_pw-error" class="error"></span></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="chkpassword" name="chkpassword"
						placeholder="비밀번호 확인"></td>
					<td><span id="u_pw-error" class="error"></span></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="u_nm" name="u_nm" placeholder="아무개" /></td>
					<td><span id="u_nm-error" class="error"></span></td>
				</tr>
				<tr>
					<td>휴대 전화 번호</td>
					<td><input class="tel" type="text" id="u_num" name="u_num"
						maxlength="15" placeholder="010-1111-2222"></td>
					<td><span id="u_num-error" class="error"></span></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" id="u_email" name="u_email" /></td>
					<td><span id="u_email-error" class="error"></span></td>
				</tr>
				<tr>
					<td>주민등록번호</td>
					<td><input type="text" id="u_identy" name="u_identy"
						onkeyup="addHyphen()"></td>
					<td><span id="u_identy-error" class="error"></span></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="u_add" name="address">
						&nbsp;&nbsp;
						<button class="btn btn-outline-secondary" type="button"
							onclick="sample6_execDaumPostcode()">주소 찾기</button></td>
					<td><span id="u_add-error" class="error"></span></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" id="sample6_detailAddress"
						name="detailAddress" class="form-control" placeholder="상세주소">
					</td>
					<td></td>
				</tr>
				<tr>
					<c:if test="${loginUser.role eq '0' }">
						<td>권한</td>
						<td><input type="radio" name="u_role" value='0'
							checked="checked" />관리자
						<td><input type="radio" name="u_role" value='1' />사용자
					</c:if>
				</tr>
			</table>
			<button type="submit">가입하기</button>
		</form>
		<br /> <a href="/login.do">로그인</a>
	</section>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
</body>

<script>
function sample6_execDaumPostcode() {
	  daum.postcode.load(function () {
	    new daum.Postcode({
	      oncomplete: function (data) {
	        var addr = ''; // 주소 변수
	        var extraAddr = ''; // 참고항목 변수

	        if (data.userSelectedType === 'R') {
	          // 사용자가 도로명 주소를 선택했을 경우
	          addr = data.roadAddress;
	        } else {
	          // 사용자가 지번 주소를 선택했을 경우
	          addr = data.jibunAddress;
	        }

	        if (data.userSelectedType === 'R' && data.bname !== '') {
	          extraAddr += data.bname;
	        }

	        if (data.buildingName !== '' && data.apartment === 'Y') {
	          extraAddr += extraAddr !== '' ? ', ' + data.buildingName : data.buildingName;
	        }

	        if (extraAddr !== '') {
	          extraAddr = ' (' + extraAddr + ')';
	        }

	        document.getElementById('u_add').value = addr; // 수정된 부분
	        document.getElementById('sample6_detailAddress').focus();
	      },
	    }).open();
	  });
	}
</script>
<%-- 유효성 검사 단 --%>
<script>
	function validateId() {
		var id = $("#u_id").val();
		var idRegex = /^[a-zA-Z0-9]{1,16}$/;
		if (!idRegex.test(id)) {
			$("#u_id").addClass("is-invalid");
			$("#u_id-error").text("영대소문자 및 숫자로 1자 이상 16자 이하 입력하세요.");
			$("#u_id-error").show();
			return false;
		} else {
			$("#u_id").removeClass("is-invalid");
			$("#u_id-error").hide();
			return true;
		}
	}

	function validatePassword() {
		var password = $("#u_pw").val();
		var passwordRegex = /^[a-zA-Z0-9]{1,16}$/;
		if (!passwordRegex.test(password)) {
			$("#u_pw").addClass("is-invalid");
			$("#u_pw-error").text("영대소문자 및 특수문자로 6자 이상 입력하세요.");
			$("#u_pw-error").show();
			return false;
		} else {
			$("#u_pw").removeClass("is-invalid");
			$("#u_pw-error").hide();
			return true;
		}
	}

	function validateName() {
		var name = $("#u_nm").val();
		if (name === "") {
			$("#u_nm").addClass("is-invalid");
			$("#u_nm-error").text("이름을 입력하세요.");
			$("#u_nm-error").show();
			return false;
		} else {
			$("#u_nm").removeClass("is-invalid");
			$("#u_nm-error").hide();
			return true;
		}
	}

	function validatePhone() {
		var phone = $("#u_num").val();
		var phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
		if (!phoneRegex.test(phone)) {
			$("#u_num").addClass("is-invalid");
			$("#u_num-error").text("올바른 전화번호 형식으로 입력하세요 (010-0000-0000).");
			$("#u_num-error").show();
			return false;
		} else {
			$("#u_num").removeClass("is-invalid");
			$("#u_num-error").hide();
			return true;
		}
	}

	function validateEmail() {
		var email = $("#u_email").val();
		var emailRegex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
		if (!emailRegex.test(email)) {
			$("#u_email").addClass("is-invalid");
			$("#u_email-error").text("올바른 이메일 형식으로 입력하세요.");
			$("#u_email-error").show();
			return false;
		} else {
			$("#u_email").removeClass("is-invalid");
			$("#u_email-error").hide();
			return true;
		}
	}

	function validateIdenty() {
		var identy = $("#u_identy").val();
		var identyRegex = /^\d{6}-?\d{7}$/;
		if (!identyRegex.test(identy)) {
			$("#u_identy").addClass("is-invalid");
			$("#u_identy-error")
					.text("올바른 주민등록번호 형식으로 입력하세요 (XXXXXX-XXXXXXX).");
			$("#u_identy-error").show();
			return false;
		} else {
			$("#u_identy").removeClass("is-invalid");
			$("#u_identy-error").hide();
			return true;
		}
	}

	function validateAddress() {
		var address = $("#u_add").val();
		if (address === "") {
			$("#u_add").addClass("is-invalid");
			$("#u_add-error").text("주소를 입력하세요.");
			$("#u_add-error").show();
			return false;
		} else {
			$("#u_add").removeClass("is-invalid");
			$("#u_add-error").hide();
			return true;
		}
	}

	function addHyphen() {
		var identy = $("#u_identy").val();
		identy = identy.replace(/[^0-9]/g, '');
		if (identy.length > 6) {
			identy = identy.substring(0, 6) + "-" + identy.substring(6);
		}
		$("#u_identy").val(identy);
	}

	function checkSubmit() {
		if (validateId() && validatePassword() && validateName()
				&& validatePhone() && validateEmail() && validateIdenty()
				&& validateAddress()) {
			return true;
		} else {
			return false;
		}
	}
</script>
</html>
<%-- 
<form id="signup-form" method="post">
	<table border="1" style="solid">
		<tr>
			<td>아이디</td>
			<td><input type="text" id="u_id" name="u_id" placeholder="영대소문자 및 숫자"></td>
			<td><span id="u_id-error" class="error"></span></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="u_pw" name="u_pw" placeholder="영대소문자 및 특수문자 6자리 이상"></td>
			<td><span id="u_pw-error" class="error"></span></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="u_nm" name="u_nm" placeholder="아무개"/></td>
			<td><span id="u_nm-error" class="error"></span></td>
		</tr>
		<tr>
			<td>휴대 전화 번호</td>
			<td><input class="tel" type="text" id="u_num" name="u_num" maxlength="15" placeholder="010-1111-2222"></td>
			<td> <span id="u_num" class="error"></span></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" name="email"/></td>
			<td><span id="u_email" class="error"></span></td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td><input type="text" id="u_identy" name="u_identy" onkeyup="addHyphen()"></td>
			<td><span id="u_identy" class="error"></span></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" id="u_add" name="u_add"></td>
			<td><span id="u_add" class="error"></span></td>
		</tr>
		<tr>
		<c:if test="${loginUser.role eq '0' }">
			<td>권한</td>
			<td><input type="radio" name="u_role" value='0' checked="checked"/>관리자
			<td><input type="radio" name="u_role" value='1'/>사용자
			</c:if>
		</tr>
	</table>
	<button type="button" onclick="submitForm()">가입하기</button>
</form>
<br/>
<a href="/login.do">로그인</a>
</body> --%>
<!-- <script>
function submitForm() {
    // AJAX를 통해 서버로 유효성 검사 요청
    $.ajax({
        url: "validateUser.jsp", // 유효성 검사를 수행할 JSP 페이지 경로
        method: "POST",
        data: $("#signup-form").serialize(), // 폼 데이터 직렬화하여 전송
        dataType: "json",
        success: function(response) {
            // 유효성 검사 결과를 받아 처리
            if (response.valid) {
                // 유효성 검사 통과 시 폼 제출
                $("#signup-form")[0].submit();
            } else {
                // 유효성 검사 실패 시 오류 메시지를 표시
                displayErrors(response.errors);
            }
        }
    });
}
</script> 
</html>-->
