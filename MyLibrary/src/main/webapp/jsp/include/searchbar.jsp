<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function searchBooks() {
  var searchType = document.querySelector('select[name="searchType"]').value;
  var query = document.querySelector('input[name="query"]').value;
  
  console.log(searchType);
  console.log(query);

  // AJAX 요청 생성
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "searchbook.do?searchType=" + searchType + "&query=" + query, true);
  // 요청 완료 시 동작할 콜백 함수
  xhr.onload = function() {
    if (xhr.status === 200) {
      // 서버 응답을 처리하는 코드
      var response = xhr.responseText;

      // 동적으로 로드된 booklist.jsp를 포함하는 div 요소 -> ajax가 시행되고 이후 로드가 되므로 해당처리가 필요함
      var container = document.getElementById("booklist-container");

      // div 요소 내부에 response 삽입
      container.innerHTML = response;

      // 새로 로드된 booklist.jsp에서 search-results 요소 가져오기
      var resultContainer = document.getElementById("search-results");

      // 예시: 검색 결과를 특정 요소에 표시
      if (resultContainer) {
        resultContainer.innerHTML = response;
      }
      // 원하는 동작을 위해 함수 호출(다만 ajax는 서순이 중요해서 작동하기 바라는 함수는 이쪽에도 재정의해둬야함)
      // 시점 조절을 위해 새로 로드된 booklist.jsp에서 버튼 이벤트 등록
      var button = document.getElementById("confirmation-button");
      if (button) {
        button.addEventListener("click", showConfirmation);
      }

      // 로그인 페이지로 이동 버튼 이벤트 등록
      var loginButton = document.getElementById("login-button");
      if (loginButton) {
        loginButton.addEventListener("click", redirectToLogin);
      }
    }
  };
  // AJAX 요청 전송
  xhr.send();

  // 폼 전송 막기
  return false;
}
function redirectToLogin() {
	alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
	window.location.href = "login.do";
}
function showConfirmation() {
	if (confirm("해당 책을 대여하시겠습니까?")) {
		window.location.href = "rentprocess.do?isbn=${book.isbn}";
	}
//이쪽단에서 keyaction을 주고 있는 것이나 마찬가지라서 해당 버튼이 적용되는 곳에서는(booklit의 버튼) onclick이벤트를 주면 안된다
//ajax보다 onclick 이벤트가 더 우선시 되기 때문
}
</script>
<div class="search-bar">
    <form class="d-flex align-items-center" onsubmit="return searchBooks()">
        <div class="input-group">
            <select class="form-select" name="searchType">
                <option value="all">통합검색</option>
                <option value="title">도서명 검색</option>
                <option value="author">저자 검색</option>
                <option value="publisher">출판사 검색</option>
                <option value="isbn">ISBN 검색</option>
            </select>
            <input type="text" class="form-control me-2" name="query" placeholder="검색어를 입력하세요" required>
        </div>
        <button class="btn btn-primary" type="submit">검색</button>
    </form>
</div>
