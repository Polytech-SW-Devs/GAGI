<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 소비자와 생산자가 직접 거래하는</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: white;
}
/* ===== MAIN ===== */
main {
	max-width: 1920px;
	margin: 0 auto;
	padding: 50px 360px 80px;
}

/* Hero Banner */
.hero-banner {
	width: 1200px;
	height: 200px;
	margin-bottom: 40px;
	border-radius: 20px;
	overflow: hidden;
	position: relative;
}

.hero-banner img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.hero-text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	color: #415703;
	font-size: 48px;
}

.hero-text .normal {
	font-weight: 500;
}

.hero-text .bold {
	font-weight: 700;
}

/* Category Section */
.category-section {
	margin-bottom: 60px;
}

.section-title {
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 20px; /* Adjusted margin */
}

.list-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.total-count {
	font-size: 16px;
	color: #555;
}

.sort-options {
	display: flex;
	gap: 20px;
}

.sort-link {
	font-size: 16px;
	color: #888;
	text-decoration: none;
}

.sort-link.active {
	color: #333;
	font-weight: 500;
}

.products-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	width: 1200px;
}

.product-card {
	width: 285px;
	min-width: 210px;
	background: white;
	cursor: pointer;
}

.product-image {
	width: 100%;
	height: 288px;
	background: #f5f5f5;
	border-radius: 15px;
	border: 1px solid #DDDDDD;
}

.product-info {
	padding: 15px 0;
}

.product-name {
	font-size: 20px;
	font-weight: 500;
	line-height: 30px;
	margin-bottom: 5px;
}

.product-price {
	font-size: 20px;
	color: #555555;
	line-height: 28px;
	margin-bottom: 5px;
}

.product-meta {
	font-size: 16px;
	color: #555555;
	line-height: 28px;
	margin-bottom: 5px;
}

.seller-info {
	display: flex;
	align-items: center;
	gap: 5px;
	font-size: 14px;
	height: 28px;
}

.seller-avatar {
	width: 24px;
	height: 24px;
	background: #ddd;
	border-radius: 50%;
}

.rating {
	color: #FFA600;
}

.rating-value {
	color: #555555;
	font-size: 16px;
}

/* Pagination */
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 5px;
	margin-top: 50px;
}

.page-btn {
	width: 40px;
	height: 40px;
	background: white;
	border: 1px solid #DDDDDD;
	border-radius: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

.page-btn.arrow {
	background: white;
}

.page-number {
	width: 40px;
	height: 40px;
	border-radius: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	font-size: 14px;
	line-height: 22px;
}

.page-number.active {
	background: #501845;
	color: white;
}

.page-number:not(.active) {
	background: transparent;
	color: black;
}
</style>
<script>
	const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="${pageContext.request.contextPath}/js/search.js"></script>
</head>
<body>
	<%@ include file="templete/header.jsp"%>

	<!-- ===== MAIN ===== -->
	<main>


		<!-- Category Products -->
		<section class="category-section">
			<h2 class="section-title">
				<c:choose>
					<c:when test="${not empty sectionTitle}">
						${sectionTitle}
					</c:when>
					<c:otherwise>
						카테고리
					</c:otherwise>
				</c:choose>
			</h2>

			<div class="list-header">
				<div class="total-count">전체 <fmt:formatNumber value="${pager.total}" pattern="#,###" />개</div>
				<div class="sort-options">
					<c:url var="latestSortUrl" value="${baseUrl}">
						<c:param name="page" value="1"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
						<c:param name="sort" value="latest" />
					</c:url>
					<a href="${latestSortUrl}" class="sort-link ${pager.sort == 'latest' ? 'active' : ''}">신상품순</a>

					<c:url var="nameSortUrl" value="${baseUrl}">
						<c:param name="page" value="1"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
						<c:param name="sort" value="name" />
					</c:url>
					<a href="${nameSortUrl}" class="sort-link ${pager.sort == 'name' ? 'active' : ''}">가나다순</a>

					<c:url var="popularSortUrl" value="${baseUrl}">
						<c:param name="page" value="1"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
						<c:param name="sort" value="popular" />
					</c:url>
					<a href="${popularSortUrl}" class="sort-link ${pager.sort == 'popular' ? 'active' : ''}">추천상품순</a>
				</div>
			</div>
			<div class="products-grid">
				<c:forEach var="item" items="${items}">
					<div class="product-card" data-item-id="${item.id}">
						<div class="product-image"></div>
						<div class="product-info">
							<div class="product-name">${item.title}</div>
							<div class="product-price">
								<fmt:formatNumber value="${item.price}" pattern="#,###" />
								원
							</div>
							<div class="product-meta">구매수 : ${item.purchaseCount}건</div>
							<div class="product-meta">
								등록날짜 :
								<fmt:formatDate value="${item.createdAtDate}"
									pattern="yyyy.MM.dd" />
							</div>
							<div class="seller-info">
								<div class="seller-avatar"></div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- Pagination -->
			<!-- Pagination -->
			<div class="pagination">
				<c:if test="${pager.page > 1}">
					<c:url var="firstPageUrl" value="${baseUrl}">
						<c:param name="page" value="1"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
					</c:url>
					<a href="${firstPageUrl}" class="page-btn arrow">&laquo;</a>

					<c:url var="prevPageUrl" value="${baseUrl}">
						<c:param name="page" value="${pager.prev}"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
					</c:url>
					<a href="${prevPageUrl}" class="page-btn arrow">&lt;</a>
				</c:if>

				<c:forEach var="p" items="${pager.list}">
					<c:url var="currentPageUrl" value="${baseUrl}">
						<c:param name="page" value="${p}"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
					</c:url>
					<a href="${currentPageUrl}" class="page-number ${p == pager.page ? 'active' : ''}">${p}</a>
				</c:forEach>

				<c:if test="${pager.page < pager.last}">
					<c:url var="nextPageUrl" value="${baseUrl}">
						<c:param name="page" value="${pager.next}"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
					</c:url>
					<a href="${nextPageUrl}" class="page-btn arrow">&gt;</a>

					<c:url var="lastPageUrl" value="${baseUrl}">
						<c:param name="page" value="${pager.last}"/>
						<c:if test="${not empty keyword}">
							<c:param name="keyword" value="${keyword}" />
						</c:if>
					</c:url>
					<a href="${lastPageUrl}" class="page-btn arrow">&raquo;</a>
				</c:if>
			</div>

		</section>
	</main>

	<!-- ===== FOOTER ===== -->
	<jsp:include page="templete/footer.jsp"></jsp:include>
</body>
</html>