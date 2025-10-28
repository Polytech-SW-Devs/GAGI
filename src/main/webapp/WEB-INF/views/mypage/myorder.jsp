<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 구매내역</title>
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

.purchase-history {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 30px;
	transition: all 0.3s ease;
}

.purchase-history:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.history-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.history-header h3 {
	font-size: 24px;
	font-weight: 500;
}

/* 필터 버튼 스타일 */
.filter-buttons {
	display: flex;
	gap: 10px;
	margin-bottom: 30px;
	flex-wrap: wrap;
}

.filter-btn {
	padding: 10px 20px;
	border: 2px solid #ddd;
	background: white;
	color: #333;
	text-decoration: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 500;
	transition: all 0.3s ease;
}

.filter-btn:hover {
	background: #f5f5f5;
	border-color: #501845;
	color: #501845;
	transform: translateY(-2px);
}

.filter-btn.active {
	background: #501845;
	border-color: #501845;
	color: white;
}

.table-container {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: center;
	font-size: 16px;
	border-bottom: 1px solid #eee;
}

th {
	font-weight: 500;
	background: #f9f9f9;
	border-bottom: 2px solid #ddd;
}

/* 상품 정보 셀 */
.product-info {
	display: flex;
	align-items: center;
	gap: 15px;
	text-align: left;
}

.product-image {
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 8px;
	flex-shrink: 0;
}

.product-image-placeholder {
	width: 80px;
	height: 80px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	border-radius: 8px;
	flex-shrink: 0;
}

.product-details {
	flex: 1;
}

.product-title {
	text-decoration: none;
	color: #333;
	font-weight: 500;
	display: block;
	margin-bottom: 5px;
}

.product-title:hover {
	color: #501845;
}

.product-quantity {
	color: #666;
	font-size: 14px;
}

/* 주문 상태 배지 */
.status-badge {
	display: inline-block;
	padding: 6px 12px;
	background: #501845;
	color: white;
	border-radius: 6px;
	font-size: 14px;
	font-weight: 500;
	margin-bottom: 8px;
}

/* 취소 버튼 */
.cancel-btn {
	padding: 6px 12px;
	border: 1px solid #ddd;
	background: white;
	color: #333;
	border-radius: 6px;
	font-size: 13px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.cancel-btn:hover {
	background: #f8d7da;
	border-color: #f5c6cb;
	color: #721c24;
}

/* 리뷰 작성 링크 */
.review-link {
	color: #501845;
	text-decoration: none;
	font-weight: 500;
	font-size: 14px;
}

.review-link:hover {
	text-decoration: underline;
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
	
	.sidebar {
		width: 100%;
		margin-bottom: 30px;
	}
}

@media (max-width: 768px) {
	main {
		padding: 30px 20px 50px;
	}
	
	.filter-buttons {
		justify-content: center;
	}
	
	.product-info {
		flex-direction: column;
		text-align: center;
	}
	
	table {
		font-size: 14px;
	}
	
	th, td {
		padding: 10px 5px;
	}
	
	.product-image,
	.product-image-placeholder {
		width: 60px;
		height: 60px;
	}
}
</style>

<script>
const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/mypage/myorder.js"></script>
</head>
<body>
	<%@ include file="../templete/header.jsp" %>

	<main>
		<div class="container">
			<!-- 사이드바 -->
			<jsp:include page="/WEB-INF/views/templete/mypageSidebar.jsp" />

			<div class="main-content">
				<section class="purchase-history">
					<div class="history-header">
						<h3>구매 내역</h3>
					</div>

					<!-- 주문 상태 필터 버튼 -->
					<div class="filter-buttons">
						<a href="<c:url value='/mypage/myorder'/>" class="filter-btn ${empty param.orderStatus ? 'active' : ''}">전체</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=입금준비'/>" class="filter-btn ${param.orderStatus == '입금준비' ? 'active' : ''}">입금준비</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=입금완료'/>" class="filter-btn ${param.orderStatus == '입금완료' ? 'active' : ''}">입금완료</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=배송중'/>" class="filter-btn ${param.orderStatus == '배송중' ? 'active' : ''}">배송중</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=배송완료'/>" class="filter-btn ${param.orderStatus == '배송완료' ? 'active' : ''}">배송완료</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=취소'/>" class="filter-btn ${param.orderStatus == '취소' ? 'active' : ''}">취소</a>
					</div>

					<div class="table-container">
						<table>
							<thead>
								<tr>
									<th style="width: 15%;">주문일자</th>
									<th style="width: 45%;">상품정보</th>
									<th style="width: 15%;">주문금액</th>
									<th style="width: 15%;">주문상태</th>
									<th style="width: 10%;">리뷰작성</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
									<tr>
										<td colspan="5" class="empty-state">
											<i>📦</i>
											<div>구매 내역이 없습니다</div>
										</td>
									</tr>
								</c:if>

								<c:forEach var="order" items="${list}">
									<tr>
										<td>
											<fmt:formatDate value="${order.createdAtDate}" pattern="yyyy-MM-dd" />
										</td>
										<td>
											<div class="product-info">
												<c:choose>
													<c:when test="${not empty order.filename}">
														<img src="${pageContext.request.contextPath}/upload/${order.filename}"
															alt="${order.title}" class="product-image">
													</c:when>
													<c:otherwise>
														<div class="product-image-placeholder"></div>
													</c:otherwise>
												</c:choose>
												<div class="product-details">
													<a href="<c:url value='/product/detail/${order.itemId}'/>" class="product-title">${order.title}</a>
													<div class="product-quantity">${order.amount}개</div>
												</div>
											</div>
										</td>
										<td>
											<fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />원
										</td>
										<td>
											<div>
												<span class="status-badge">${order.orderStatus}</span>
											</div>
											<c:if test="${order.orderStatus == '입금준비' || order.orderStatus == '입금완료'}">
												<button class="cancel-btn cancel-order-btn" data-order-id="${order.id}">주문취소</button>
											</c:if>
										</td>

										<td class="text-center">
											<a href="${pageContext.request.contextPath}/review/writeForm?orderId=${order.id}">리뷰작성</a>
										<td>
											<a href="${pageContext.request.contextPath}/review/writeForm?productId=${order.itemId}" class="review-link">리뷰작성</a>
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
				</section>
			</div>
		</div>
	</main>

	<%@ include file="../templete/footer.jsp" %>
</body>
</html>