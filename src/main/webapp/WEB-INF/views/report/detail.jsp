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
    <h1>신고 상세보기</h1>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
        	<th>신고번호</th>
        	<td>${post.defectId}</td>
        </tr>
    	
    	<tr>
    		<th>주문상품번호</th>
    		<td>${post.orderItemId}</td>
    	</tr>
    	
    	<tr>
    		<th>신고유형</th>
    		<td>${post.defectType}</td>
    	</tr>
    	
    	<tr>
    		<th>내용</th>
    		<td>${post.description}</td>
    	</tr>
    	
    	<tr>
    		<th>상태</th>
    		<td>${post.status}</td>
    	</tr>
    	
    	<tr>
    		<th>작성일</th>
    		<td>${post.createdAt}</td>
    	</tr>
    </table>
    

	<c:if test="${not empty post.imageUrl}">
    	<p>첨부이미지:</p>
    	<img src="${pageContext.request.contextPath}/uploads/${post.imageUrl}" width="300">
	</c:if>

    <a href="${pageContext.request.contextPath}/report/edit/${post.defectId}">수정</a>
	<a href="${pageContext.request.contextPath}/report/list">목록</a>

</body>
</html>