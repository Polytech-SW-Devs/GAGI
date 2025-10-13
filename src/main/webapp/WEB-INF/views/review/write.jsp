<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
</head>
<body>
	<h1>후기 작성</h1>

    	<!-- POST는 BaseBoardController write(T, session) -->
        <form action="${pageContext.request.contextPath}/review/write" method="post">

        	<!-- 상품명 (수정 불가) -->
            <div>
                <label>상품명</label>
                <input type="text" value="${title}" readonly>
                <input type="hidden" name="targetId" value="${targetId}">
            </div>

            <!-- 작성자 닉네임 (수정 불가) -->
            <div>
            	<label>작성자</label>
                <input type="text" value="${nickname}" readonly>
                <input type="hidden" name="reviewerId" value="${reviewerId}">
            </div>

            <!-- 평점 선택 -->
            <div>
            	<label>평점</label>
                <select class="form-select" name="ratingNumber" required>
                	<option value="">선택</option>
                    <option value="5">★★★★★</option>
                    <option value="4">★★★★</option>
                    <option value="3">★★★</option>
                    <option value="2">★★</option>
                    <option value="1">★</option>
                </select>
            </div>

            <!-- 리뷰 내용 -->
            <div>
            	<label>리뷰 내용</label>
                <textarea name="commentText" placeholder="리뷰를 작성해주세요" required></textarea>
            </div>

            <!-- 작성일 (자동 표시) -->
            <div>
            	<label>작성일</label>
                <input type="text" value="<fmt:formatDate value='${now}' pattern='yyyy-MM-dd'/>" readonly>
            </div>

            <div>
            	<button type="submit">등록</button>
                <a href="javascript:history.back()">취소</a>
            </div>
	</form>
</body>
</html>