<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../templete/logo.jsp"></jsp:include>
</head>
<body>
<div>
	<div class="container">
	<div>
		
		<div>
			<c:choose>
	    		<c:when test="${not empty loginUser}">
	        		<p>${loginUser.nickname}님, 환영합니다!</p>
	        		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	        		<a href="${pageContext.request.contextPath}/mypage">마이페이지</a>
	        		<a href="${pageContext.request.contextPath}/mycart/view/${loginUser.id}">장바구니</a><!-- 장바구니 경로 설정해야함 -->
	    		</c:when>
	    		<c:otherwise>
	        		<a href="${pageContext.request.contextPath}/login">로그인</a>
	        		<a href="${pageContext.request.contextPath}/join">회원가입</a>
	    		</c:otherwise>
			</c:choose>
		</div>
		<div>
			<form class="row">
				<div class=col></div>
					<input type="text" name="keyword" class="fomr-control form-control-smd d-grid">
					<button class="btn btn-primary btn-sm ">검색</button>	
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>

