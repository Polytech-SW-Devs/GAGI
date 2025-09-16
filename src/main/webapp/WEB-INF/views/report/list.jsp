<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 목록</title>
</head>
<body>
	<h1>신고 목록</h1>
	
	<!-- 검색 -->
	<form method="get" action="${pageContext.request.contextPath}/report/list">
    	<input type="text" name="search" value="${search}" placeholder="검색어 입력">
    	<button type="submit">검색</button>
	</form>
	
	<table border="1" cellpadding="5">
  		<tr>
    		<th>ID</th>
    		<th>상품</th>
    		<th>유형</th>
    		<th>상태</th>
    		<th>작성일</th>
  		</tr>
  		
  		<c:forEach var="post" items="${list}">
    		<tr>
      			<td><a href="${pageContext.request.contextPath}/report/${post.defectId}">${post.defectId}</a></td>
      			<td>${post.productId}</td>
      			<td>${post.defectType}</td>
      			<td>${post.status}</td>
      			<td>${post.createdAt}</td>
    		</tr>
  		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
    	<c:if test="${page > 1}">
        	<a href="?page=${page-1}&search=${search}">이전</a>
    	</c:if>

    페이지 ${page} / ${totalPages}

    	<c:if test="${page < totalPages}">
        	<a href="?page=${page+1}&search=${search}">다음</a>
    	</c:if>
	</div>
	<a href="${pageContext.request.contextPath}/report/writeWithFile">신고하기</a>
</body>
</html>