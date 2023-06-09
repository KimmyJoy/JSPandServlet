<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/MyLibrary/jsp/layout.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
		<jsp:include page="/jsp/include/searchbar.jsp"/>
	</header>
	<section id="contatiner">
		<div class="row">
			<div class="col-3">
				<aside class="col-md-3">
					<jsp:include page="/jsp/include/sidebar_user.jsp" />
				</aside>
			</div>
			<div class="col-9 mycontent">
				<h2>대여 중인 도서 목록</h2>
				<table class="table">
					<thead>
						<tr>
							<th>도서명</th>
							<th>저자</th>
							<th>출판사</th>
							<th>반납일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>도서 1</td>
							<td>저자 1</td>
							<td>출판사 1</td>
							<td>2023-06-30</td>
						</tr>
						<tr>
							<td>도서 2</td>
							<td>저자 2</td>
							<td>출판사 2</td>
							<td>2023-07-10</td>
						</tr>
						<!-- 다른 도서 정보 추가 -->
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<section></section>
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp" />
		<!-- 지시자라고 함..< %요겅 근데 이걸 쓰면 여기에 쓰인 내용을 복사 붙여넣기 하는거라 많으면 많을수록 줄이 쓸데없이 많아질 수 있음 -->
	</footer>
</body>
</html>