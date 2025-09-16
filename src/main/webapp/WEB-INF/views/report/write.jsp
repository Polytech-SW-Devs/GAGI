<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
</head>
<body>
	<h1>신고하기</h1>
	<form method="post" action="${pageContext.request.contextPath}/report/write">
  		<label>상품ID: <input type="text" name="productId"></label><br>
  		<label>불량유형: <input type="text" name="defectType"></label><br>
  		<label>설명: <textarea name="description"></textarea></label><br>
  		<label>이미지URL: <input type="text" name="imageUrl"></label><br>
  		<button type="submit">등록</button>
	</form>

</body>
</html>