<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
</head>
<body>
	<h1>문의 작성</h1>
    
    <form method="post" action="${pageContext.request.contextPath}/inquiry/write">
    
    	<p>
        	<label>카테고리</label><br>
        	<select name="category">
        		<option value="상품">상품</option>
        		<option value="배송">배송</option>
        		<option value="환불">환불</option>
        		<option value="기타">기타</option>
        	</select>
    	</p>
    	
    	<p>
        	<label>제목</label><br>
        	<input type="text" name="subject" required>
    	</p>

    	<p>
        	<label>내용</label><br>
        	<textarea name="content" rows="10" cols="60" required></textarea>
    	</p>
    	
    	<button type="submit">저장</button>
	</form>

	<a href="${pageContext.request.contextPath}/inquiry/list">목록으로</a>
</body>
</html>
</body>
</html>