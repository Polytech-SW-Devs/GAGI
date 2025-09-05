<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>
	<h1>공지사항 목록</h1>
    
    <!-- 검색 -->
	<form method="get" action="">
    	<input type="text" name="search" value="${param.search}" placeholder="검색어 입력">
    	<button type="submit">검색</button>
	</form>
	
	<!-- 리스트 -->
	<table border="1" width="100%">
    	<tr>
        	<th>번호</th>
        	<th>제목</th>
        	<th>작성자</th>
        	<th>등록일</th>
    	</tr>

    	<c:forEach var="item" items="${list}">
        	<tr>
            	<td>${item.id}</td>
            	<td>
                	<a href="${pageContext.request.contextPath}/notice/list">공지사항</a>
            	</td>
            	<td>${item.admin_id}</td>
            	<td>${item.posted_at}</td>
        	</tr>
    	</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<c:set var="totalPages" value="${total / 10 + (total % 10 == 0 ? 0 : 1)}"/>
    	<c:forEach begin="1" end="${totalPages}" var="i">
        	<c:choose>
            	<c:when test="${i == param.page}">
                	<b>[${i}]</b>
            	</c:when>
            	<c:otherwise>
                	<a href="?page=${i}&search=${param.search}">[${i}]</a>
            	</c:otherwise>
        	</c:choose>
    	</c:forEach>
	</div>
	
	<!-- 등록 버튼 -->
	<a href="${pageContext.request.contextPath}/notice/write">글쓰기</a>
</body>
</html>
</body>
</html>