<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 신고 내역</title>
</head>
<body>
	<h1>내 신고 내역</h1>
	<table>
  		<tr>
    		<th>ID</th>
    		<th>상품</th>
    		<th>유형</th>
    		<th>상태</th>
    		<th>등록일</th>
  		</tr>
  		<c:forEach var="report" items="${list}">
    		<tr>
      			<td>${report.defectId}</td>
      			<td>${report.productId}</td>
      			<td>${report.defectType}</td>
      			<td>${report.status}</td>
      			<td>${report.createdAt}</td>
    		</tr>
  		</c:forEach>
	</table>

	<a href="${pageContext.request.contextPath}/report/list">목록으로</a>
</body>
</html>