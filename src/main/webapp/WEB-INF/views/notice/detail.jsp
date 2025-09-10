<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세</title>
</head>
<body>
	<h1>후기 상세보기</h1>
    
    <p><b>번호:</b> ${post.id}</p>
	<p><b>제목:</b> ${post.subject}</p>
	<p><b>작성자:</b> ${post.reviewer_id}</p>
	<p><b>평점:</b> ${post.rating} / 5</p>
	<p><b>내용:</b> ${post.comment}</p>
	<p><b>등록일:</b> ${post.created_at}</p>
	
	<a href="${pageContext.request.contextPath}/review/edit/${post.id}">수정</a>
	<a href="${pageContext.request.contextPath}/review/list">목록으로</a>
</body>
</html>
</body>
</html>