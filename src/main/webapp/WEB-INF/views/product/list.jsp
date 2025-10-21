<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 나의 게시판</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: white;
	min-height: 100vh;
}

/* ===== MAIN ===== */
main {
	max-width: 1920px;
	margin: 0 auto;
	padding: 50px 360px 80px;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	display: flex;
	gap: 30px;
}

.main-content {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 30px;
}

.board-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 30px;
	transition: all 0.3s ease;
}

.board-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.board-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.board-header h3 {
	font-size: 24px;
	font-weight: 500;
}

/* 게시판 검색 바 */
.board-search-bar {
	margin-bottom: 30px;
	display: flex;
	gap: 10px;
	justify-content: center;
	flex-wrap: wrap;
}

.board-search-bar form {
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
	align-items: center;
}

.board-search-bar select,
.board-search-bar input[type="text"] {
	padding: 10px 15px;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-size: 14px;
	transition: all 0.3s ease;
}

.board-search-bar select {
	min-width: 120px;
}

.board-search-bar input[type="text"] {
	min-width: 250px;
	flex: 1;
}

.board-search-bar select:focus,
.board-search-bar input[type="text"]:focus {
	outline: none;
	border-color: #501845;
}

.board-search-btn {
	padding: 10px 25px;
	background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 2px 8px rgba(80, 24, 69, 0.3);
}

.board-search-btn:hover {
	background: linear-gradient(135deg, #6a1f5a 0%, #501845 100%);
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(80, 24, 69, 0.4);
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
	padding: 10px 4px;
	text-align: center;
	font-size: 14px;
	border-bottom: 1px solid #eee;
}

th {
	font-weight: 500;
	background: #f9f9f9;
	border-bottom: 2px solid #ddd;
	white-space: nowrap;
}

td {
	vertical-align: middle;
	white-space: nowrap; /*  한 줄로 표시 */
	overflow: hidden; /* 넘치는 내용 숨김 */
	text-overflow: ellipsis; /* 말줄임표 */
}

td img {
	border-radius: 8px;
	object-fit: cover;
}

td a {
	color: #501845;
	text-decoration: none;
	font-weight: 500;
	transition: all 0.3s ease;
}

td a:hover {
	color: #6a1f5a;
	text-decoration: underline;
}

/* 관리 버튼 */
.action-buttons {
	display: flex;
	gap: 5px;
	justify-content: center;
	align-items: center;
}

.action-btn {
	padding: 6px 12px;
	border: 1px solid #ddd;
	background: white;
	color: #333;
	text-decoration: none;
	border-radius: 6px;
	font-size: 13px;
	cursor: pointer;
	transition: all 0.3s ease;
	display: inline-block;
}

.action-btn:hover {
	background: #f5f5f5;
	border-color: #501845;
	color: #501845;
}

.action-btn.delete-btn {
	background: #ff4444;
	border-color: #ff4444;
	color: white;
}

.action-btn.delete-btn:hover {
	background: #cc0000;
	border-color: #cc0000;
}

.empty-state {
	text-align: center;
	padding: 60px 20px;
	color: #8E8E8E;
	font-size: 16px;
}

.empty-state i {
	font-size: 48px;
	display: block;
	margin-bottom: 15px;
}

/* 페이지네이션 */
.pagination-container {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.pagination {
	display: flex;
	gap: 5px;
	list-style: none;
	align-items: center;
}

.pagination li {
	display: inline-block;
}

.pagination a {
	display: block;
	padding: 8px 12px;
	border: 1px solid #ddd;
	background: white;
	color: #333;
	text-decoration: none;
	border-radius: 8px;
	font-size: 14px;
	transition: all 0.3s ease;
	min-width: 40px;
	text-align: center;
}

.pagination a:hover {
	background: #f5f5f5;
	border-color: #501845;
	color: #501845;
}

.pagination li.active a {
	background: #501845;
	border-color: #501845;
	color: white;
	font-weight: 500;
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
	box-shadow: 0 4px 12px rgba(80, 24, 69, 0.4);
	color: white;
}

@media (max-width: 1600px) {
	main {
		padding: 50px 100px 80px;
	}
}

@media (max-width: 1400px) {
	main {
		padding: 50px 50px 80px;
	}
	
	.container {
		flex-direction: column;
	}
}

@media (max-width: 768px) {
	main {
		padding: 30px 20px 50px;
	}
	
	table {
		font-size: 12px;
	}
	
	th, td {
		padding: 8px 4px;
	}
	
	.board-search-bar form {
		flex-direction: column;
		width: 100%;
	}
	
	.board-search-bar select,
	.board-search-bar input[type="text"],
	.board-search-btn {
		width: 100%;
	}
}
</style>
</head>
<body>
<jsp:include page="../templete/header.jsp"></jsp:include>

<main>
	<div class="container">
		<!-- 사이드바 -->
		<jsp:include page="/WEB-INF/views/templete/mypageSidebar.jsp" />

		<div class="main-content">
			<section class="board-section">
				<div class="board-header">
					<h3>나의 게시판</h3>
				</div>

				<div class="board-search-bar">
				    <form method="get">
				        <select name="search">
				            <option value="1" <c:if test="${pager.search == 1}">selected</c:if>>카테고리</option>
				            <option value="2" <c:if test="${pager.search == 2}">selected</c:if>>제목</option>
				            <option value="3" <c:if test="${pager.search == 3}">selected</c:if>>원산지</option>
				        </select>
				
				        <input type="text" name="keyword" value="${pager.keyword}" placeholder="검색어를 입력해주세요">
				        <button class="board-search-btn" type="submit">검색</button>
				    </form>
				</div>


				<div class="table-container">
					<table>
						<thead>
							<tr>
								<th style="width: 8%;">가격</th>
								<th style="width: 10%;">카테고리</th>
								<th style="width: 8%;">이미지</th>
								<th style="width: 15%;">제목</th>
								<th style="width: 15%;">상품설명</th>
								<th style="width: 6%;">수량</th>
								<th style="width: 8%;">원산지</th>
								<th style="width: 8%;">직거래</th>
								<th style="width: 10%;">생성일</th>
								<th style="width: 6%;">조회수</th>
								<th style="width: 10%;">관리</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="11" class="empty-state">
										<i>📦</i>
										<div>준비된 물건이 없습니다.</div>
									</td>
								</tr>
							</c:if>

							<c:forEach var="item" items="${list}">
								<tr>
									<td><fmt:formatNumber value="${item.price}" pattern="#,##0" />원</td>
									<td>${item.categoryName}</td>
									<td>
										<c:if test="${not empty item.fileName}">
											<img alt="${item.title}" src="${pageContext.request.contextPath}/upload/${item.fileName}" width="50" height="50">
										</c:if>
									</td>
									<td style="max-width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"><a href="../product/detail/${item.id}">${item.title}</a></td>
									<td style="max-width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${item.description}</td>
									<td>${item.amount}개</td>
									<td>${item.delivery}</td>
									<td>${item.isDirectDeal}</td>
									<td>${item.createdAt.toLocalDate()}</td>
									<td>${item.views}</td>
									<td>
										<div class="action-buttons">
											<a href="${pageContext.request.contextPath}/product/update/${item.id}" class="action-btn">변경</a>
											<form action="${pageContext.request.contextPath}/product/delete/${item.id}"
												  method="post"
												  onsubmit="return confirm('정말 삭제하시겠습니까?');"
												  style="display:inline; margin: 0;">
												<button type="submit" class="action-btn delete-btn">삭제</button>
											</form>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 페이지네이션 -->
				<div class="pagination-container">
					<ul class="pagination">
						<li>
							<a href="?page=1${pager.query}">처음</a>
						</li>
						<li>
							<a href="?page=${pager.prev}${pager.query}">이전</a>
						</li>

						<c:forEach var="page" items="${pager.list}">
							<li class="${pager.page == page ? 'active' : ''}">
								<a href="?page=${page}${pager.query}">${page}</a>
							</li>
						</c:forEach>

						<li>
							<a href="?page=${pager.next}${pager.query}">다음</a>
						</li>
						<li>
							<a href="?page=${pager.last}${pager.query}">마지막</a>
						</li>
					</ul>
				</div>

				<!-- 글쓰기 버튼 -->
				<div class="write-btn-container">
					<a href="../product/add" class="write-btn">글쓰기</a>
				</div>
			</section>
		</div>
	</div>
</main>

<%@ include file="../templete/footer.jsp" %>
</body>
</html>