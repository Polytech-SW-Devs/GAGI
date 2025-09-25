<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 수정</title>
</head>
<body>
	<h1>신고 수정</h1>
	<form action="${pageContext.request.contextPath}/report/edit" method="post">
  		<input type="hidden" name="defectId" value="${post.defectId}">
  		<label>불량유형: <input type="text" name="defectType" value="${post.defectType}"></label><br>
  		<label>설명: <textarea name="description">${post.description}</textarea></label><br>
  		<button type="submit">수정</button>
	</form>


	<a href="${pageContext.request.contextPath}/report/${post.defectId}">상세보기</a>
	<a href="${pageContext.request.contextPath}/report/list">목록으로</a>
</body>
</html>