<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세보기</title>
</head>
<body>
    <h1>후기 상세보기</h1>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>리뷰 ID</th>
            <td>${post.id}</td>
        </tr>
        <tr>
            <th>상품명</th>
            <td>${post.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${post.nickname}</td>
        </tr>
        <tr>
            <th>대상 ID</th>
            <td>${post.targetId}</td>
        </tr>
        <tr>
            <th>평점</th>
            <td>${post.ratingNumber}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${post.commentText}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${post.createdAt}</td>
        </tr>
        <tr>
            <th>수정일</th>
            <td>
                <c:choose>
                    <c:when test="${not empty post.updatedAt}">
                        ${post.updatedAt}
                    </c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </table>



    <a href="${pageContext.request.contextPath}/review/edit/${post.id}">수정</a> |
    <a href="${pageContext.request.contextPath}/review/delete/${post.id}">삭제</a> |
    <a href="${pageContext.request.contextPath}/review/list?targetId=${post.targetId}">목록으로</a>

</body>
</html>