<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
</head>
<body>
<h2>고객센터</h2>

<p>아래 메뉴를 클릭하면 각 게시판으로 이동합니다.</p>

<ul>
    <li><a href="${pageContext.request.contextPath}/review/list">리뷰</a></li>
    <li><a href="${pageContext.request.contextPath}/inquiry/list">문의</a></li>
    <li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
    <li><a href="${pageContext.request.contextPath}/report/list">신고</a></li>
</ul>

</body>
</html>