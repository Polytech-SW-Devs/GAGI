<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 신고 목록</title>
</head>
<body>
	<h1>관리자 신고 목록</h1>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>신고자</th>
            <th>상품</th>
            <th>불량유형</th>
            <th>설명</th>
            <th>상태</th>
            <th>등록일</th>
            <th>상태 변경</th>
        </tr>
        <c:forEach var="report" items="${list}">
            <tr>
                <td>${report.defectId}</td>
                <td>${report.userId}</td>
                <td>${report.productId}</td>
                <td>${report.defectType}</td>
                <td>${report.description}</td>
                <td>${report.status}</td>
                <td>${report.createdAt}</td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/report/admin/${report.defectId}/status">
                        <select name="status">
                            <option value="PENDING" ${report.status == 'PENDING' ? 'selected' : ''}>접수</option>
                            <option value="IN_PROGRESS" ${report.status == 'IN_PROGRESS' ? 'selected' : ''}>처리중</option>
                            <option value="RESOLVED" ${report.status == 'RESOLVED' ? 'selected' : ''}>완료</option>
                        </select>
                        <button type="submit">변경</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
	<a href="${pageContext.request.contextPath}/report/list">목록으로</a>
</body>
</html>