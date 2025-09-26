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
	<div class="reply-section">
    <h3>댓글</h3>

    <!-- 댓글 작성 -->
    <form action="${pageContext.request.contextPath}/reply/write" method="post">
        <input type="hidden" name="postId" value="${post.id}">
        <input type="hidden" name="boardType" value="${boardType}">
        <textarea name="content" rows="3" placeholder="댓글을 입력하세요"></textarea><br>
        <button type="submit">등록</button>
    </form>

    <!-- 댓글 목록 -->
    <c:forEach var="reply" items="${replies}">
        <div class="reply-item">
            <strong>${reply.userNickname}</strong> (${reply.createdAt})
            <p>${reply.content}</p>

            <!-- 본인 댓글일 때만 수정/삭제 버튼 -->
            <c:if test="${loginUser.id == reply.userId}">
                <form action="${pageContext.request.contextPath}/reply/delete" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="${reply.id}">
                    <input type="hidden" name="postId" value="${post.id}">
                    <input type="hidden" name="boardType" value="${boardType}">
                    <button type="submit">삭제</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>
</body>
</html>