<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<h2>관리자 페이지</h2>
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
                    </div>
                </div>

					<div
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
						<div class="icon-box" data-aos="fade-up" data-aos-delay="200">
							<div class="icon">
								<i class="bx bx-file"></i>
							</div>
							<h4 class="title">
								<a href="#" onclick="showProductList(); return false;">상품 조회</a>
							</h4>
						</div>
					</div>

					<div
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
						<div class="icon-box" data-aos="fade-up" data-aos-delay="300">
							<div class="icon">
								<i class="bx bx-tachometer"></i>
							</div>
							<h4 class="title">
								 <!-- onclick 이벤트를 추가하여 클릭 시 loadProductList 함수가 실행되도록 함 -->
            				<a href="#" >휴면 계좌</a>
							</h4>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
						<div class="icon-box" data-aos="fade-up" data-aos-delay="400">
							<div class="icon">
								<i class="bx bx-world"></i>
							</div>
							<h4 class="title">
								<a href="">게시판 관리</a>
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
            <form id="addProductForm" action="${pageContext.request.contextPath}/addProduct.do" method="POST">
                <input type="text" name="p_nm" placeholder="상품명" required>
                <select name="p_type" required onchange="handleProductTypeChange(this)">
                    <option value="">상품 유형 선택</option>
                    <option value="saving">적금(Saving)</option>
                    <option value="deposit">예금(Deposit)</option>
                </select>
                    <input type="number" name="p_rate" placeholder="이율" step="0.01" min="0" required>
                    <input type="number" name="p_min_deposit" placeholder="최소 예치 금액" min="50,000" required>
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
        <!-- 숨겨진 상품 조회 view 요소 -->
        <div id="productTable" style="display: none;">
        <table id="productlist" >
    <thead>
        <tr>
            <th>상품 코드</th>
            <th>상품명</th>
            <th>상품 유형</th>
            <th>이율</th>
            <th>최소 예치 금액</th>
            <th>상품 설명</th>
            <th>매월 예치 금액 (적금)</th>
            <th>만기일 (적금)</th>
            <th>예금기간 (예금)</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody>
     <!-- Javascript를 통해 동적으로 데이터를 입력할 예정 -->
    </tbody>
</table>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Product details will go here -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//모든 섹션을 숨기는 함수
function hideAllSections() {
    $("#addProductView").hide();
    $("#productTable").hide();
}

// 상품 리스트를 보여주고, 데이터를 로드하는 함수
function showProductList() {
    hideAllSections();
    $("#productTable").show();
    loadProductList();
}

// 상품 리스트 데이터를 가져와서 테이블에 추가하는 함수
function loadProductList() {
    $.ajax({
        type: "GET",
        url: '/OpenBank/getAllProducts.do',
        success: function (data) {
            var productTable = $("#productTable").find("tbody");

            data.forEach(function (product) {
                var newRow = $("<tr></tr>");

                // 상품 정보를 셀로 추가
                newRow.append("<td>" + product.p_cd + "</td>");
                newRow.append("<td>" + product.p_nm + "</td>");
                newRow.append("<td>" + product.p_type + "</td>");
                newRow.append("<td>" + product.p_rate + "</td>");
                newRow.append("<td>" + product.p_min_deposit + "</td>");
                newRow.append("<td>" + product.p_description + "</td>");

                if (product.p_type === "saving") {
                    newRow.append("<td>" + product.monthly_deposit + "</td>");
                    newRow.append("<td>" + product.maturity_date + "</td>");
                    newRow.append("<td>-</td>");
                } else if (product.p_type === "deposit") {
                    newRow.append("<td>-</td>");
                    newRow.append("<td>-</td>");
                    newRow.append("<td>" + product.p_d_term + "</td>");
                }

                // 수정 버튼 추가
                newRow.append("<td><button onclick=\"editProduct('" + product.p_cd + "')\">수정</button></td>");

                // 삭제 버튼 추가
                newRow.append("<td><button onclick=\"deleteProduct('" + product.p_cd + "')\">삭제</button></td>");

                productTable.append(newRow);
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("상품 리스트를 불러오는 데 실패했습니다.");
        }
    });
}

function addProduct() {
    hideAllSections();
    $("#addProductView").show();

    $("#addProductForm").off("submit").on("submit", function (event) {
        event.preventDefault(); // 기본 제출 동작 막기
        //...
        //Ajax 요청 등 코드는 기존대로 사용하시면 됩니다.
        //...
        alert("상품이 성공적으로 추가되었습니다.");
    });
}

function updateProduct(p_cd) {
    var updatedData = {
        p_cd: p_cd,
        // 수정된 정보를 여기에 추가합니다.
    };

    $.ajax({
        type: "POST",
        url: '/OpenBank/editProduct.do', // 적절한 URL로 변경
        data: updatedData,
        success: function (response) {
            alert("상품이 성공적으로 수정되었습니다.");
            loadProductList();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("상품 정보를 수정하는 데 실패했습니다.");
        }
    });
}

function deleteProduct(p_cd) {
    if (confirm("정말로 이 상품을 삭제하시겠습니까?")) {
        $.ajax({
            url: '/OpenBank/deleteProduct.do', // 적절한 URL로 변경
            type: "POST",
            data: {
                p_cd: p_cd
            },
            success: function () {
                alert("상품이 성공적으로 삭제되었습니다.");
                loadProductList();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("상품 삭제에 실패했습니다: " + textStatus);
            }
        });
    }
}

function editProduct(p_cd) {
    $.ajax({
        type: "POST",
        url: '/OpenBank/editProduct.do', // 적절한 URL로 변경
        data: {
            p_cd: p_cd
        },
        success: function (product) {
            var productInfo =
                "상품 코드: " + product.p_cd + "\n" +
                "상품명: " + product.p_nm + "\n" +
                "상품 유형: " + product.p_type + "\n" +
                "이율: " + product.p_rate + "\n" +
                "최소 예치 금액: " + product.p_min_deposit + "\n" +
                "상품 설명: " + product.p_description + "\n" +
                "매월 예치 금액 (적금): " + (product.p_type === "saving" ? product.monthly_deposit : "-") + "\n" +
                "만기일 (적금): " + (product.p_type === "saving" ? product.maturity_date : "-") + "\n" +
                "예금기간 (예금): " + (product.p_type === "deposit" ? product.p_d_term : "-");

            alert(productInfo);
            loadProductList();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("상품 정보를 수정하는 데 실패했습니다.");
        }
    });
}

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