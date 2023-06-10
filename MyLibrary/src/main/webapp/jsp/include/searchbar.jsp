<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="search-bar">
    <form class="d-flex align-items-center" action="searchbook.do" method="get">
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
