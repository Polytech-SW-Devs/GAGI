<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../views/templete/header.jsp"></jsp:include>
<div>
	<div class="container">
	<div>
		<div><h3><a href=".">GAGI</a></h3></div>
		<div>
			<c:choose>
	    		<c:when test="${not empty loginUser}">
	        		<p>
	        		${sessionScope.loginUser.nickname}
	        		${loginUser.nickname}
	        		님, 환영합니다!
	        		</p>
	        		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
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
	
<jsp:include page="../views/templete/footer.jsp"></jsp:include>