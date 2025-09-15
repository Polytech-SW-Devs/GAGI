<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 목록</title>
</head>
<body>
	<h1>후기 목록</h1>
    
    <!-- 검색 -->
	<form method="get" action="${pageContext.request.contextPath}/review/list">
    	<input type="text" name="search" value="${search}" placeholder="검색어 입력">
    	<button type="submit">검색</button>
	</form>
	
	<!-- 리스트 -->
	<table border="1" cellpadding="5">
    	<tr>
        	<th>번호</th>
        	<th>주문 아이템 ID</th>
        	<th>대상 ID</th>
        	<th>평점</th>
        	<th>작성일</th>
    	</tr>

    	<c:forEach var="post" items="${list}">
        	<tr>
            	<td>${post.id}</td>
            	<td>${post.order_item_id}</td>
            	<td>${post.target_id}</td>
            	<td>${post.rating_number}</td>
            	<td>${post.created_at}</td>
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
	
	<!-- 등록 버튼 -->
	<a href="${pageContext.request.contextPath}/review/write">후기 작성</a>
</body>
</html>
</body>
</html>