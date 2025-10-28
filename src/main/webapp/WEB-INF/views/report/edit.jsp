<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 수정</title>
</head>
<body>
	<h1>신고 수정</h1>
    
	<form method="post" action="${pageContext.request.contextPath}/report/edit" enctype="multipart/form-data">
		
    	<input type="hidden" name="id" value="${post.defectId}">
    	
    	<table>
        	<tr>
            	<th>신고유형</th>
            	<td><input type="text" name="defectType" value="${post.defectType}"></td>
        	</tr>
        	<tr>
            	<th>신고내용</th>
            	<td><textarea name="description" rows="5" cols="40">${post.description}</textarea></td>
        	</tr>
        	<tr>
            	<th>첨부이미지</th>
            	<td><input type="file" name="imageFile" accept="image/*"></td>
        	</tr>
    	</table>
   	
    	<button type="submit">수정</button>   
    	<a href="${pageContext.request.contextPath}/report/list">목록</a> 	
	</form>

</body>
</html>