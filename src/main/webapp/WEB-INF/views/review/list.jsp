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
        	<th>상품명</th>
        	<th>작성자</th>
        	<th>평점</th>
        	<th>작성일</th>
    	</tr>

    	<c:forEach var="post" items="${list}">
        	<tr>
            	<td>${post.id}</td>
            	<td>${post.title}</td>
            	<td>${post.nickname}</td>
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