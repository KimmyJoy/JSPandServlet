<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 20px;">
            <div class="container">
                <form action="searchProduct.do" method="post">
                    <div class="row g-2">
                        <div class="col-md-10">
                            <div class="row g-2">
                                <div class="col-md-4">
                                    <select class="form-select border-0 py-3" name="productType">
                                        <option selected value="all">통합 상품 검색</option>
                                        <option value="saving">적금 상품 검색</option>
                                        <option value="deposit">예금 상품 검색</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control border-0 py-3" placeholder="검색어를 입력해주세요" required name="keyword">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="btn btn-dark border-0 w-100 py-3" value="검색">
                        </div>
                    </div>
                </form>
            </div>
        </div>


