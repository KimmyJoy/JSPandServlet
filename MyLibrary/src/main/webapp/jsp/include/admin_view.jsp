<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<!-- 도서 관리 페이지 -->
<div id="book_management" class="page">
  <!-- 도서 관리 페이지 내용 -->
  <h2>도서 관리 페이지</h2>
<div id="booklist-container"></div>
   <jsp:include page="/jsp/include/searchbar.jsp"/><br>
  <div class="btn-group">
   <button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#addNewBook" aria-expanded="false">신규도서 등록</button>
</div>

<div class="btn-group">
    <button type="button" class="btn btn-success" aria-expanded="false">삭제</button>
    <br>
</div>
</div>
</div>

<!-- 게시판 관리 페이지 -->
<div id="board_management" class="page">
  <!-- 게시판 관리 페이지 내용 -->
  <h2>게시판 관리 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>

<!-- 회원 관리 페이지 -->
<div id="member_management" class="page">
  <!-- 회원 관리 페이지 내용 -->
  <h2>회원 관리 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>

<!-- 정보 수정 페이지 -->
<div id="profile" class="page">
  <!-- 정보 수정 페이지 내용 -->
  <h2>정보 수정 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>

<!-- 문의하기 페이지 -->
<div id="inquiry" class="page">
  <!-- 문의하기 페이지 내용 -->
  <h2>문의하기 페이지</h2>
  <!-- 추가적인 내용 작성 -->
</div>


<%-- 도서 신규등록 모달 --%>
	<div class="modal fade" id="addNewBook" tabindex="-1"
		aria-labelledby="newBookModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content input-form mx-auto">
				<div class="modal-header">
					<h5 class="modal-title" id="addNewBook">신규도서 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%-- 모달 내용 --%>
				<div class="modal-body">
					<form method="post" action="addBook.do" name="addBookForm"
						class="validation-form" novalidate>
						<div id="rentStatus">
							<label for="status1"><input type="radio" id="status1"
								name="status" value="1" checked> 대출활성화</label> <label
								for="status0"><input type="radio" id="status0"
								name="status" value="0"> 대출비활성화</label>
						</div>

						<label for="isbn">ISBN</label> <input type="text"
							class="form-control" id="isbn" name="isbn" autocorrect="off"
							autocapitalize="none" placeholder="공백이나 -없이 10~13자리" value=""
							pattern="([0-9]{13})$" required>
						<div class="invalid-feedback">10~13자리의 숫자를 입력해주세요</div>
						<div id="invalid-feedback" style="color: red;"></div>
						<div id="valid-feedback" style="color: green;"></div>


						<label for="title">도서명</label> <input type="text"
							class="form-control" id="title" name="title" autocorrect="off"
							autocapitalize="none" placeholder="시선으로부터" value="" required>
						<div class="invalid-feedback">도서명을 입력해주세요</div>

						<label for="author">저자</label> <input type="text"
							class="form-control" id="author" name="author" autocorrect="off"
							autocapitalize="none" placeholder="정세랑" value="" required>
						<div class="invalid-feedback">저자를 입력해주세요</div>

						<label for="publisher">출판사</label> <input type="text"
							class="form-control" id="publisher" name="publisher"
							autocorrect="off" autocapitalize="none" placeholder="문학동네"
							value="" required>
						<div class="invalid-feedback">출판사를 입력해주세요</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-success">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
function updateButtons() {
	var checkboxes = document.getElementsByName('check');

	for (var i = 0; i < checkboxes.length; i++) {
		var status = checkboxes[i].getAttribute('data-status');

		if (status === '0') {
			checkboxes[i].disabled = true; // 대출 불가능일 때 체크박스 비활성화
		} else {
			checkboxes[i].disabled = false; // 대출 가능일 때 체크박스 활성화
		}
	}
}
// 페이지 로드 시 체크박스 업데이트
window.onload = function () {
	updateButtons();
};
