<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 상세보기</title>
</head>
<body>
	<h1>신고 상세</h1>
	<p>신고번호: ${post.defectId}</p>
	<p>상품: ${post.productId}</p>
	<p>불량유형: ${post.defectType}</p>
	<p>설명: ${post.description}</p>
	<p>상태: ${post.status}</p>
	<p>등록일: ${post.createdAt}</p>

	
	<a href="${pageContext.request.contextPath}/report/edit/${post.defectId}">수정</a>
	<a href="${pageContext.request.contextPath}/report/delete/${post.defectId}">삭제</a>
	<a href="${pageContext.request.contextPath}/report/list">목록으로</a>
</body>
</html>