<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 도서목록</title>
<!-- Bootstrap CSS 추가 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-pzjw8f+ua5x8kbfC94LdL4Oy5z2/zmln3woBu9H3sS4mJj7HwF6O8NoB1k4KS2a"
	crossorigin="anonymous">
</head>
<body id="search-results">
	<!-- 도서목록 테이블 -->
	 <c:choose>
        <c:when test="${empty bookList}">
            <p>검색 결과가 없습니다.</p>
        </c:when>
        <c:otherwise>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">도서번호</th>
				<th scope="col">도서명</th>
				<th scope="col">저자</th>
				<th scope="col">출판사</th>
				<th scope="col">대출상태</th>
			</tr>
		</thead>
		<tbody>
		<!-- 도서목록을 표시할 요소에 id 추가 -->
			<c:forEach var="book" items="${bookList}">
				<tr>
					<td>${book.isbn}</a></td>
					<td>${book.title}</td>
					<td>${book.writer}</td>
					<td>${book.publisher}</td>
					<td>
						<c:choose>
							<c:when test="${book.is_rented == '1'}">
								<c:choose>
									<c:when test="${empty loginUser}">
										<button type="button" class="btn btn-success" id="login-button">대여 가능</button>
										<!-- ajax로 가져온 경우  -->
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-success" id="confirmation-button">대여 가능</button>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-danger" disabled>대출 불가능</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:otherwise>
    </c:choose>
	<!-- Bootstrap JS 추가 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zySzpSlF+V0DjyL/EnLbah+cz+lsTB8I6OTKpwz"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
		integrity="sha384-OVca+rc0RfofPToACvdtSvFBEwdzP8T3WWe5DTNSaWylj+vJvUoTGtDQGM9uZNm6"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-o8ygfgsi3JQPwm6Fun6z+nbERgOXD03pX2jhli5vllPvc5ykz9WcdJ30i8l1aPeb"
		crossorigin="anonymous"></script>
</body>
</html>