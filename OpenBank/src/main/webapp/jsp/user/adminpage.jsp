<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
<header id="header" class="fixed-top d-flex align-items-center" >
<jsp:include page="../top_menu.jsp"></jsp:include>
</header>
		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">

				<div class="section-title" data-aos="fade-up">
					<h2>상품 관리</h2>
				</div>

				 <div class="row">
                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
                        <div class="icon">
                            <i class="bx bxl-dribbble"></i>
                        </div>
                        <h4 class="title">
                            <a href="#" onclick="addProduct()">상품 추가</a>
                        </h4>
                        <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
                    </div>
                </div>

					<div
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
						<div class="icon-box" data-aos="fade-up" data-aos-delay="200">
							<div class="icon">
								<i class="bx bx-file"></i>
							</div>
							<h4 class="title">
								<a href="">상품 수정</a>
							</h4>
							<p class="description">Duis aute irure dolor in reprehenderit
								in voluptate velit esse cillum dolore</p>
						</div>
					</div>

					<div
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
						<div class="icon-box" data-aos="fade-up" data-aos-delay="300">
							<div class="icon">
								<i class="bx bx-tachometer"></i>
							</div>
							<h4 class="title">
								<a href="">상품 삭제</a>
							</h4>
							<p class="description">Excepteur sint occaecat cupidatat non
								proident, sunt in culpa qui officia</p>
						</div>
					</div>

					<div
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
						<div class="icon-box" data-aos="fade-up" data-aos-delay="400">
							<div class="icon">
								<i class="bx bx-world"></i>
							</div>
							<h4 class="title">
								<a href="">Nemo Enim</a>
							</h4>
							<p class="description">At vero eos et accusamus et iusto odio
								dignissimos ducimus qui blanditiis</p>
						</div>
					</div>

				</div>
<%--  <!-- 숨겨진 view 요소 -->
        <div id="addProductView" class="hidden" style="display: none;">
            <form id="addProductForm" action="${pageContext.request.contextPath}/addProduct.do" method="POST">
                <input type="text" name="p_nm" placeholder="상품명" required>
                <select name="p_type" required onchange="handleProductTypeChange(this)">
                    <option value="">상품 유형 선택</option>
                    <option value="saving">적금(Saving)</option>
                    <option value="deposit">예금(Deposit)</option>
                </select>
                <div id="savingFields" style="display: none;">
                    <input type="number" name="p_rate" placeholder="이율" step="0.01" min="0" required>
                    <input type="number" name="p_min_deposit" placeholder="최소 예치 금액" min="50,000" required>
                    <input type="text" name="p_description" placeholder="상품 설명" required>
                    <input type="number" name="monthly_deposit" placeholder="매월 예치 금액" min="0" required>
                    <input type="date" name="maturity_date" placeholder="만기일" required>
                </div>
                <button type="submit">추가</button>
            </form>
        </div>
 --%>


			</div>
		</section>
		<!-- End Services Section -->
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>

<!-- 모달 요소 -->
<div id="successModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p id="successMessage">상품이 성공적으로 등록되었습니다.</p>
    </div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function addProduct() {
        var formHtml =  function addProduct() {
	  var formHtml = `
		  <form id="addProductForm" action="${pageContext.request.contextPath}/addProduct.do" method="POST">
          <input type="text" name="p_nm" placeholder="상품명" required>
          <select name="p_type" required onchange="handleProductTypeChange(this)">
              <option value="">상품 유형 선택</option>
              <option value="saving">적금(Saving)</option>
              <option value="deposit">예금(Deposit)</option>
          </select>
          <div id="savingFields" style="display: none;">
              <input type="number" name="p_rate" placeholder="이율" step="0.01" min="0" required>
              <input type="number" name="p_min_deposit" placeholder="최소 예치 금액" min="50,000" required>
              <input type="text" name="p_description" placeholder="상품 설명" required>
              <input type="number" name="monthly_deposit" placeholder="매월 예치 금액" min="0" required>
              <input type="date" name="maturity_date" placeholder="만기일" required>
          </div>
          <button type="submit">추가</button>
      </form>`;
	  
	  var container = document.getElementById("formContainer");
	  container.innerHTML = formHtml;
	}
 });
    </script>
    <script>
    function showAddProductModal() {
        document.getElementById("addProductView").classList.remove("hidden");
    }

    function closeSuccessModal() {
        document.getElementById("successModal").style.display = "none";
    }

    // 폼 제출 성공 시 모달 표시
    document.getElementById("addProductForm").addEventListener("submit", function (event) {
        event.preventDefault(); // 기본 제출 동작 막기

        // Ajax 또는 페이지 새로고침을 통해 서버로 폼 데이터 전송하는 코드 추가

        // 성공 모달 표시
        document.getElementById("successModal").style.display = "block";
    });

    // 모달 닫기 버튼 이벤트 처리
    document.getElementsByClassName("close")[0].addEventListener("click", closeSuccessModal);

    // 모달 영역 외 클릭 시 모달 닫기
    window.addEventListener("click", function (event) {
        if (event.target == document.getElementById("successModal")) {
            closeSuccessModal();
        }
    });
</script>
</html>