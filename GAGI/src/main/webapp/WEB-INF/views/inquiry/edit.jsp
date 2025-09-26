<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 수정</title>
</head>
<body>
	<h1>문의 수정</h1>
    
	<form method="post" action="${pageContext.request.contextPath}/inquiry/edit">
	
		<!-- 문의 ID -->
    	<input type="hidden" name="id" value="${post.id}">
    
    	<p>
        	<label>카테고리</label><br>
        	<select name="category">
        		<option value="상품" <c:if test="${post.category eq '상품'}">selected</c:if>>상품</option>
        		<option value="배송" <c:if test="${post.category eq '배송'}">selected</c:if>>배송</option>
        		<option value="환불" <c:if test="${post.category eq '환불'}">selected</c:if>>환불</option>
        		<option value="기타" <c:if test="${post.category eq '기타'}">selected</c:if>>기타</option>
        	</select>
    	</p>

    	<p>
        	<label>제목</label><br>
        	<input type="text" name="subject" value="${post.subject}" required>
    	</p>

    	<p>
        	<label>내용</label><br>
        	<textarea name="message" rows="10" cols="60" required>${post.message}</textarea>
    	</p>

    	<p>
        	<label>상태</label><br>
        	<select name="status">
        		<option value="대기" <c:if test="${post.status eq '대기'}">selected</c:if>>대기</option>
        		<option value="답변완료" <c:if test="${post.status eq '답변완료'}">selected</c:if>>답변완료</option>
        	</select>
    	</p>
    	
    	<button type="submit">저장</button>
	</form>

	<a href="${pageContext.request.contextPath}/inquiry/${post.id}">상세보기</a> |
	<a href="${pageContext.request.contextPath}/inquiry/list">목록으로</a>
</body>
</html>
</body>
</html>