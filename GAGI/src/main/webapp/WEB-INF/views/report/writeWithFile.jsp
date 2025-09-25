<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 등록</title>
</head>
<body>
	<h1>신고 등록</h1>

    <form method="post" action="${pageContext.request.contextPath}/report/writeWithFile"
          enctype="multipart/form-data">

        <div>
            <label for="defectType">불량 유형</label>
            <select name="defectType" id="defectType" required>
                <option value="">-- 선택 --</option>
                <option value="파손">파손</option>
                <option value="오배송">오배송</option>
                <option value="누락">누락</option>
                <option value="기타">기타</option>
            </select>
        </div>

        <div>
            <label for="description">상세 설명</label><br>
            <textarea name="description" id="description" rows="5" cols="50" required></textarea>
        </div>

        <div>
            <label for="imageFile">증빙 이미지</label>
            <input type="file" name="imageFile" accept="image/*" />
        </div>

        <!-- 필요하다면 hidden 값으로 userId, orderItemId, productId 전달 -->
        <input type="hidden" name="userId" value="${sessionScope.loginUser.id}">
        <input type="hidden" name="orderItemId" value="${param.orderItemId}">
        <input type="hidden" name="productId" value="${param.productId}">

        <div>
            <button type="submit">등록</button>
            <a href="${pageContext.request.contextPath}/report/list">목록</a>
        </div>
    </form>

</body>
</html>