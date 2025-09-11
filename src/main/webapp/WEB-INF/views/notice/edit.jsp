<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<h1>공지사항 수정</h1>
    
	<form method="post" action="${pageContext.request.contextPath}/review/edit">
    	<input type="hidden" name="id" value="${post.id}">
    
    	<p>
        	<label>제목</label><br>
        	<input type="text" name="title" value="${post.title}" required>
    	</p>
    	<p>
        	<label>내용</label><br>
        	<textarea name="content" rows="10" cols="60" required>${post.content}</textarea>
    	</p>
    	<p>
        	<label>공개 여부</label><br>
        	<select name="visible">
        		<option value="Y" <c:if test="${post.visible eq 'Y'}">selected</c:if>>공개</option>
            	<option value="N" <c:if test="${post.visible eq 'N'}">selected</c:if>>비공개</option>
        	</select>
    	</p>
    	
    	<p>
    		<label>게시 시작일</label>
    		<input type="date" name="posted_at" value="${post.posted_at}">
    	</p>
    	
    	<p>
    		<label>만료일</label>
    		<input type="date" name="expires_at" value="${post.expires_at}">
    	</p>
    	
    	<button type="submit">저장</button>
	</form>

	<a href="${pageContext.request.contextPath}/notice/${post.id}">상세보기</a>
	<a href="${pageContext.request.contextPath}/notice/list">목록으로</a>
</body>
</html>