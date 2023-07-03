<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<header id="header" class="fixed-top d-flex align-items-center">
		<jsp:include page="../top_menu.jsp"></jsp:include>
	</header>
	<!-- ======= Services Section ======= -->
	<section id="services" class="services">
		<div class="container">

			<div class="section-title" data-aos="fade-up">
				<h2>관리자 페이지</h2>
			</div>

			<div class="row">
				<div
					class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
					<div class="icon-box" data-aos="fade-up" data-aos-delay="100">
						<div class="icon">
							<i class="bi bi-collection"></i>
						</div>
						<h4 class="title">
							<a href="#" onclick="addProduct()">상품 추가</a>
						</h4>
					</div>
				</div>

				<div
					class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
					<div class="icon-box" data-aos="fade-up" data-aos-delay="200">
						<div class="icon">
							<i class="bx bx-file"></i>
						</div>
						<h4 class="title">
							 <a href="${pageContext.request.contextPath}/getAllProducts.do?type=saving">적금 상품 조회</a>
						</h4>

					</div>
				</div>

				<div
					class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
					<div class="icon-box" data-aos="fade-up" data-aos-delay="300">
						<div class="icon">
							<i class="bi bi-file-bar-graph"></i>
						</div>
						<h4 class="title">
							<!-- onclick 이벤트를 추가하여 클릭 시 loadProductList 함수가 실행되도록 함 -->
							<a href="${pageContext.request.contextPath}/getAllProducts.do?type=deposit">예금 상품 조회</a>
						</h4>
					</div>
				</div>

				<div
					class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
					<div class="icon-box" data-aos="fade-up" data-aos-delay="400">
						<div class="icon">
							<i class="bi bi-unlock"></i>
						</div>
						<h4 class="title">
							<a href="${pageContext.request.contextPath}/jsp/account/unfreezaccount.jsp">휴면 계좌 관리</a>
						</h4>
					</div>
				</div>

			</div>


		</div>
	</section>
	<!-- End Services Section -->
	<section>
		<!-- 숨겨진 상품 등록 view 요소 -->
		<div id="addProductView" class="hidden" style="display: none;">
			<form id="addProductForm" action="/OpenBank/addProduct.do" method="POST">
				<input type="text" name="p_nm" placeholder="상품명" required>
				<select name="p_type" required onchange="handleProductTypeChange(this)">
					<option value="">상품 유형 선택</option>
					<option value="saving">적금(Saving)</option>
					<option value="deposit">예금(Deposit)</option>
				</select> 
						<input type="number" name="p_rate" placeholder="이율" required>
						<input type="number" name="p_min_deposit" placeholder="최소 예치 금액" required>
						<input type="text" name="p_description" placeholder="상품 설명" required>
				<div id="savingFields" style="display: none;">
					<input type="number" name="monthly_deposit" placeholder="매월 예치 금액" min="0">
						<input type="date" name="maturity_date" placeholder="만기일">
				</div>
				<div id="depositFields" style="display: none;">
					<input type="number" name="p_d_term" placeholder="예금기간" min="0">
				</div>
				<button type="submit">추가</button>
			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

	<!-- 성공 메시지 모달 -->
	<div id="successModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p id="successMessage">상품이 성공적으로 등록되었습니다.</p>
		</div>
	</div>

	<!-- 상품 상세정보 모달 -->
	<div id="productModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Product Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Product details will go here -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
	<script>
    function addProduct() {
        var addProductForm = document.getElementById("addProductForm");

        document.getElementById("addProductView").style.display = "block";

        addProductForm.addEventListener("submit", function (event) {
            event.preventDefault(); // 기본 제출 동작 막기

            $.ajax({
            	 type: "POST",
            	    url: $("#addProductForm").attr('action'),
            	    data: $("#addProductForm").serialize(),
            	    success: function(response) {
            	        if (response.success) {
            	            // 성공 모달 표시
            	            document.getElementById("successModal").style.display = "block";
            	            document.getElementById("successMessage").textContent = response.message;
            	        } else {
            	            alert(response.message); // 실패한 경우 alert로 메시지 표시
            	        }
            	    },
            	    error: function(jqXHR, textStatus, errorThrown) {
            	        alert("서버 통신 중 오류가 발생했습니다: " + textStatus); // 서버와 통신 중 오류가 발생한 경우
            	    }
            	});

            // 성공 모달 표시
            document.getElementById("successModal").style.display = "block";
        });
    }

    function closeSuccessModal() {
        document.getElementById("successModal").style.display = "none";
    }

    // 모달 닫기 버튼 이벤트 처리
    document.getElementsByClassName("close")[0].addEventListener("click", closeSuccessModal);

    // 모달 영역 외 클릭 시 모달 닫기
    window.addEventListener("click", function (event) {
        if (event.target == document.getElementById("successModal")) {
            closeSuccessModal();
        }
    });
</script>
<script>
	function handleProductTypeChange(selectElement) {
		var savingFields = $("#savingFields");
		var depositFields = $("#depositFields");

		if (selectElement.value === "saving") {
			savingFields.show();
			depositFields.hide();
		} else if (selectElement.value === "deposit") {
			savingFields.hide();
			depositFields.show();
		}
	}
</script>
</html>