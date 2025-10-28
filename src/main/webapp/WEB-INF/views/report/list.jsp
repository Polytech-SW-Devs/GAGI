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
	
	<!-- 리스트 -->
	<table border="1" cellpadding="5">
    	<tr>
        	<th>신고번호</th>
        	<th>주문상품번호</th>
        	<th>신고유형</th>
        	<th>내용</th>
        	<th>상태</th>
        	<th>작성일</th>
    	</tr>

    	<c:forEach var="report" items="${list}">
        	<tr>
            	<td>${report.defectId}</td>
            	<td>${report.orderItemId}</td>
            	<td>${report.defectType}</td>
            	<td>
					<a href="${pageContext.request.contextPath}/report/detail/${report.defectId}">
						${report.description}
					</a>
				</td>
            	<td>${report.status}</td>
            	<td><fmt:formatDate value="${report.createdAt}" pattern="yyyy-MM-dd HH:mm"/></td>
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
	<a href="${pageContext.request.contextPath}/report/write">신고 작성</a>
</body>
</html>