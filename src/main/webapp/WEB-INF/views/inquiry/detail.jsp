<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 상세보기</title>
</head>
<body>
	<h1>문의 상세보기</h1>
    
    <p><strong>아이디:</strong> ${post.id}</p>
	<p><strong>카테고리:</strong> ${post.category}</p>
	<p><strong>제목:</strong> ${post.subject}</p>
	<p><strong>내용:</strong><br>${post.message}</p>
	<p><strong>상태:</strong> ${post.status}</p>
	<p><strong>작성일:</strong> ${post.created_at}</p>
	<p><strong>수정일:</strong> ${post.updated_at}</p>

	<a href="${pageContext.request.contextPath}/inquiry/edit/${post.id}">수정</a> |
	<a href="${pageContext.request.contextPath}/inquiry/delete/${post.id}">삭제</a> |
	<a href="${pageContext.request.contextPath}/inquiry/list">목록으로</a>
</body>
</html>