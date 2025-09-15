<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<c:choose>
    		<c:when test="${not empty loginUser}">
        		<p>${loginUser.nickname} 님, 환영합니다!</p>
        		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
    		</c:when>
    		<c:otherwise>
        		<a href="${pageContext.request.contextPath}/login">로그인</a>
        		<a href="${pageContext.request.contextPath}/join">회원가입</a>
    		</c:otherwise>
		</c:choose>
	</div>
	
</body>
</html>