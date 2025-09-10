<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
	<h1>공지사항 상세보기</h1>
    
    <p><strong>아이디:</strong> ${post.id}</p>
	<p><strong>제목:</strong> ${post.title}</p>
	<p><strong>내용:</strong><br>${post.content}</p>
	<p><strong>공개여부:</strong> ${post.visible}</p>
	<p><strong>게시 시작일:</strong> ${post.posted_at}</p>
	<p><strong>만료일:</strong> ${post.expires_at}</p>
	<p><strong>작성일:</strong> ${post.created_at}</p>
	<p><strong>수정일:</strong> ${post.updated_at}</p>
	<p><strong>상태:</strong>
		<c:choose>
			<c:when test="${post.active}">유효</c:when>
			<c:otherwise>만료</c:otherwise>
		</c:choose> 
	</p>
	
	<a href="${pageContext.request.contextPath}/notice/edit/${post.id}">수정</a>
	<a href="${pageContext.request.contextPath}/notice/delete/${post.id}">삭제</a>
	<a href="${pageContext.request.contextPath}/notice/list">목록으로</a>
</body>
</html>