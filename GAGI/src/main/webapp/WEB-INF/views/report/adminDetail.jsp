<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 상세 (관리자)</title>
</head>
<body>
	<h1>신고 상세 (관리자)</h1>

    <table border="1">
        <tr>
            <th>신고 ID</th>
            <td>${post.defectId}</td>
        </tr>
        <tr>
            <th>신고자</th>
            <td>${post.userId}</td>
        </tr>
        <tr>
            <th>상품 ID</th>
            <td>${post.productId}</td>
        </tr>
        <tr>
            <th>불량 유형</th>
            <td>${post.defectType}</td>
        </tr>
        <tr>
            <th>설명</th>
            <td>${post.description}</td>
        </tr>
        <tr>
            <th>증빙 이미지</th>
            <td>
                <c:if test="${not empty post.imageUrl}">
                    <img src="${post.imageUrl}" width="200" alt="증빙 이미지">
                </c:if>
                <c:if test="${empty post.imageUrl}">
                    없음
                </c:if>
            </td>
        </tr>
        <tr>
            <th>상태</th>
            <td>${post.status}</td>
        </tr>
        <tr>
            <th>등록일</th>
            <td>${post.createdAt}</td>
        </tr>
        <tr>
            <th>수정일</th>
            <td>${post.updatedAt}</td>
        </tr>
    </table>

    <h3>상태 변경</h3>
    <form method="post" action="${pageContext.request.contextPath}/report/admin/${post.defectId}/status">
        <select name="status">
            <option value="PENDING" ${post.status == 'PENDING' ? 'selected' : ''}>접수</option>
            <option value="IN_PROGRESS" ${post.status == 'IN_PROGRESS' ? 'selected' : ''}>처리중</option>
            <option value="RESOLVED" ${post.status == 'RESOLVED' ? 'selected' : ''}>완료</option>
        </select>
        <button type="submit">상태 변경</button>
    </form>

    <p>
        <a href="${pageContext.request.contextPath}/report/admin/list">목록으로</a>
    </p>
</body>
</html>