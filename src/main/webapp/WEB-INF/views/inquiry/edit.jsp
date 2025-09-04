<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
</head>
<body>
	<h1>리뷰 수정</h1>
    
	<form method="post" action="${pageContext.request.contextPath}/review/edit">
    	<input type="hidden" name="id" value="${post.id}">
    
    	<p>
        	<label>제목</label><br>
        	<input type="text" name="subject" value="${post.subject}" required>
    	</p>
    	<p>
        	<label>내용</label><br>
        	<textarea name="comment" rows="10" cols="50" required>${post.comment}</textarea>
    	</p>
    	<p>
        	<label>평점</label><br>
        	<input type="number" name="rating" min="1" max="5" value="${post.rating}" required>
    	</p>
    	<button type="submit">저장</button>
	</form>

	<a href="${pageContext.request.contextPath}/review/${post.id}">상세보기</a>
	<a href="${pageContext.request.contextPath}/review/list">목록으로</a>
</body>
</html>
</body>
</html>