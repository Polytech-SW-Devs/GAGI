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

    <p><strong>아이디:</strong> ${post.id}</p>
	<p><strong>주문 아이템 ID:</strong> ${post.order_item_id}</p>
	<p><strong>대상 ID:</strong> ${post.target_id}</p>
	<p><strong>평점:</strong> ${post.rating_number}</p>
	<p><strong>내용:</strong> ${post.comment_text}</p>
	<p><strong>작성일:</strong> ${post.created_at}</p>
	<p><strong>수정일:</strong> ${post.updated_at}</p>


    <a href="${pageContext.request.contextPath}/review/edit/${post.id}">수정</a> |
    <a href="${pageContext.request.contextPath}/review/delete/${post.id}">삭제</a> |
    <a href="${pageContext.request.contextPath}/review/list">목록으로</a>

</body>
</html>