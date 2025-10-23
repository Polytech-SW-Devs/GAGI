<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 공지사항</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: #fff;
	min-height: 100vh;
}

/* 메인 */
main {
	max-width: 1600px;
	margin: 0 auto;
	padding: 60px 100px 100px;
}

/* 공지사항 섹션 */
.board-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 40px;
	transition: all 0.3s ease;
}

.board-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
}

.board-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.board-header h1 {
	font-size: 28px;
	font-weight: 600;
	color: #333;
}

/* 테이블 */
.table-container {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px 10px;
	text-align: center;
	font-size: 15px;
	border-bottom: 1px solid #eee;
}

th {
	background: #f9f9f9;
	font-weight: 600;
	border-bottom: 2px solid #ddd;
	color: #333;
}

td a {
	color: #501845;
	text-decoration: none;
	font-weight: 500;
}

td a:hover {
	text-decoration: underline;
	color: #6a1f5a;
}

/* 상태 표시 */
.status-active {
	color: #2e8b57;
	font-weight: 600;
}
.status-expired {
	color: #dc3545;
	font-weight: 600;
}

/* 페이지네이션 */
.pagination-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 40px;
}

.pagination {
	display: flex;
	gap: 6px;
	list-style: none;
	padding: 0;
}

.pagination li {
	display: inline-block;
}

.pagination a {
	display: block;
	padding: 8px 14px;
	border: 1px solid #ddd;
	background: white;
	color: #333;
	text-decoration: none;
	border-radius: 8px;
	font-size: 14px;
	transition: all 0.3s ease;
}

.pagination a:hover {
	background: #f5f5f5;
	border-color: #501845;
	color: #501845;
}

.pagination li.active a {
	background: #501845;
	color: white;
	font-weight: 600;
	border-color: #501845;
}

/* 글쓰기 버튼 */
.write-btn-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
}

.write-btn {
	padding: 12px 30px;
	background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
	color: white;
	text-decoration: none;
	border-radius: 10px;
	font-size: 15px;
	font-weight: 600;
	transition: all 0.3s ease;
	box-shadow: 0 2px 8px rgba(80, 24, 69, 0.3);
}

.write-btn:hover {
	background: linear-gradient(135deg, #6a1f5a 0%, #501845 100%);
	transform: translateY(-2px);
}
</style>
</head>
<body>

<jsp:include page="../templete/header.jsp"></jsp:include>

<main>
	<section class="board-section">
		<div class="board-header">
			<h1>공지사항</h1>
		</div>

		<div class="table-container">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>게시일</th>
					<th>상태</th>
				</tr>

				<c:forEach var="post" items="${noticeList}">
					<tr>
						<td>${post.id}</td>
						<td>
							<a href="${pageContext.request.contextPath}/notice/view/${post.id}">
								${post.title}
							</a>
						</td>
						<td><fmt:formatDate value="${post.postedAt}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td>
							<span class="${post.active ? 'status-active' : 'status-expired'}">
								${post.active ? '활성' : '만료'}
							</span>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!-- 페이지네이션 -->
		<div class="pagination-container">
			<ul class="pagination">
				<c:if test="${page > 1}">
					<li><a href="?page=${page-1}">이전</a></li>
				</c:if>

				<c:forEach begin="1" end="${totalPages}" var="p">
					<li class="${page == p ? 'active' : ''}">
						<a href="?page=${p}">${p}</a>
					</li>
				</c:forEach>

				<c:if test="${page < totalPages}">
					<li><a href="?page=${page+1}">다음</a></li>
				</c:if>
			</ul>
		</div>

		<!-- 관리자용 등록 버튼 -->
		<c:if test="${sessionScope.admin != null}">
			<div class="write-btn-container">
				<a href="${pageContext.request.contextPath}/notice/write" class="write-btn">공지 작성</a>
			</div>
		</c:if>
	</section>
</main>

<%@ include file="../templete/footer.jsp" %>
</body>
</html>

