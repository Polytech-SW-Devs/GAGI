<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지 마켓</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

/* Header */
.navbar {
	height: 100px;
	border-bottom: 1px solid #DDDDDD;
	padding: 0 300px;
}

.logo-icon {
	width: 52px;
	height: 52px;
	background: #61852D;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	outline: 0.5px solid rgba(97, 133, 45, 0.3);
}

.logo-text {
	color: #501845;
	font-size: 24px;
	font-weight: 700;
	margin-left: 10px;
}

.nav-link {
	color: black !important;
	font-size: 18px;
	padding: 10px 15px !important;
}

.nav-link:hover {
	color: #61852D !important;
}

.btn-login {
	background: #61852D;
	color: white;
	border-radius: 30px;
	padding: 11px 21px;
	border: none;
	font-size: 15px;
}

.btn-login:hover {
	background: #4e6f24;
	color: white;
}

.btn-signup {
	background: #501845;
	color: white;
	border-radius: 30px;
	padding: 11px 21px;
	border: none;
	font-size: 15px;
}

.btn-signup:hover {
	background: #3d1234;
	color: white;
}

/* Search Section */
.search-section {
	padding: 60px 0;
	display: flex;               /* flex로 전환 */
  justify-content: center;
}

.category-btn {
	width: 121px;
	height: 60px;
	background: white;
	border: 1px solid #DDDDDD;
	border-radius: 30px;
	font-size: 16px;
}

.category-btn:hover {
	border-color: #80BA41;
}

.search-wrapper {
	flex: 1;
	max-width: 800px;
	height: 60px;
	background: white;
	border: 2px solid #80BA41;
	border-radius: 30px;
	display: flex;
	align-items: center;
	padding: 0 20px;
}

.search-wrapper input {
	border: none;
	outline: none;
	flex: 1;
}

.btn-search {
	background: #4E822D;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 20px;
	font-size: 16px;
}

.btn-search:hover {
	background: #3d6823;
	color: white;
}

/* Hero Banner */
.hero-banner {
	height: 452px;
	border-radius: 30px;
	background: linear-gradient(135deg, #80BA41 0%, #61852D 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 60px;
}

.hero-content h1 {
	font-size: 40px;
	font-weight: 500;
	color: white;
	text-align: center;
}

.hero-content .highlight {
	font-weight: 700;
}

/* Sidebar Banner */
.sidebar-banner {
	width: 336px;
	height: 497px;
	background: linear-gradient(180deg, #61852D 0%, #80BA41 100%);
	border-radius: 20px;
	color: white;
	font-size: 24px;
	font-weight: 700;
}

/* Product Sections */
.section-title {
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 30px;
	color: black;
}

.product-scroll-container {
	overflow-x: auto;
	overflow-y: hidden;
	margin-bottom: 30px;
	padding-bottom: 20px;
}

.product-scroll-container::-webkit-scrollbar {
	height: 8px;
}

.product-scroll-container::-webkit-scrollbar-track {
	background: #f1f1f1;
	border-radius: 10px;
}

.product-scroll-container::-webkit-scrollbar-thumb {
	background: #80BA41;
	border-radius: 10px;
}

.product-scroll-container::-webkit-scrollbar-thumb:hover {
	background: #61852D;
}

.product-row {
	display: flex;
	gap: 30px;
	flex-wrap: nowrap;
}

.product-card {
	background: white;
	border-radius: 20px;
	overflow: hidden;
	transition: transform 0.3s, box-shadow 0.3s;
	position: relative;
	border: none;
	min-width: 300px;
	max-width: 300px;
	flex-shrink: 0;
}

.product-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.product-image {
	width: 100%;
	height: 288px;
	background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 100%);
	border-radius: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #999;
	font-size: 14px;
}

.card-body {
	padding: 20px;
}

.product-name {
	font-size: 20px;
	font-weight: 500;
	color: black;
	margin-bottom: 5px;
}

.product-detail {
	font-size: 16px;
	color: #555555;
	line-height: 28px;
	letter-spacing: 0.1px;
	margin-bottom: 0;
}

.seller-info {
	position: absolute;
	bottom: 20px;
	right: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.seller-avatar {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	background: linear-gradient(135deg, #80BA41 0%, #61852D 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: 700;
}

.seller-name {
	font-size: 14px;
	color: black;
	text-align: center;
}

/* Footer */
footer {
	background: #39404A;
	padding: 60px 0;
	color: white;
	margin-top: 60px;
}

.footer-links a {
	color: white;
	font-size: 16px;
	text-decoration: none;
	line-height: 28px;
	letter-spacing: 0.1px;
}

.footer-links a:hover {
	text-decoration: underline;
}

.dot {
	width: 5px;
	height: 5px;
	background: #D9D9D9;
	border-radius: 50%;
	display: inline-block;
	margin: 0 10px;
}

.footer-info {
	text-align: center;
	color: #999999;
	font-size: 16px;
	line-height: 28px;
	letter-spacing: 0.1px;
	margin-top: 10px;
}

.main-container {
	max-width: 1920px;
	margin: 0 auto;
	padding: 0 315px;
}

.position-relative-custom {
	position: relative;
}

@media ( max-width : 1600px) {
	.main-container, .navbar {
		padding-left: 100px;
		padding-right: 100px;
	}
	.sidebar-banner {
		right: -350px;
	}
}

@media ( max-width : 1200px) {
	.sidebar-banner {
		display: none;
	}
}

@media ( max-width : 768px) {
	.main-container, .navbar {
		padding-left: 20px;
		padding-right: 20px;
	}
	.navbar-nav {
		display: none;
	}
}
</style>
</head>
<body>
	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand d-flex align-items-center"
				href="${pageContext.request.contextPath}/">
				<div class="logo-icon">
					<svg width="32" height="35" viewBox="0 0 32 36"
						xmlns="http://www.w3.org/2000/svg">
                        <path
							d="M16 2C10 2 6 8 6 14C6 20 10 26 16 34C22 26 26 20 26 14C26 8 22 2 16 2Z"
							fill="white" />
                    </svg>
				</div> <span class="logo-text">가지 마켓</span>
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-center"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
				</ul>
			</div>

			<div class="d-flex gap-2">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<button class="btn btn-login"
							onclick="location.href='${pageContext.request.contextPath}/login.jsp'">로그인</button>
						<button class="btn btn-signup"
							onclick="location.href='${pageContext.request.contextPath}/signup.jsp'">회원가입</button>
					</c:when>
					<c:otherwise>
						<span class="navbar-text me-3">환영합니다,
							${sessionScope.user.name}님</span>
						<button class="btn btn-login"
							onclick="location.href='${pageContext.request.contextPath}/logout.do'">로그아웃</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>

	<!-- Main Container -->
	<div class="main-container">
		<!-- Search Section -->
		<div class="search-section">
			<form action="${pageContext.request.contextPath}/search.do"
				method="get">
				<div class="d-flex gap-3 align-items-center">
					<button type="button" class="category-btn">전체</button>
					<div class="search-wrapper">
						<input type="text" name="keyword"
							class="form-control border-0 shadow-none"
							placeholder="검색어를 입력하세요" value="${param.keyword}">
						<button type="submit" class="btn btn-search">검색</button>
					</div>
				</div>
			</form>
		</div>

		<!-- Hero Banner with Sidebar -->
		<div class="row mb-5">
			<div class="col-lg-8">
				<div class="hero-banner">
					<div class="hero-content">
						<h1>
							소비자와 생산자가 직접 거래하는<br> <span class="highlight">가지마켓</span>
						</h1>
					</div>
				</div>
			</div>
			<div class="col-lg-4 d-none d-lg-block">
				<div
					class="sidebar-banner d-flex align-items-center justify-content-center">
					광고 배너</div>
			</div>
		</div>

		<!-- Latest Products -->
		<section class="mb-5">
			<h2 class="section-title">최신상품</h2>
			<div class="product-scroll-container">
				<div class="product-row">
					<c:choose>
						<c:when test="${not empty latestProducts}">
							<c:forEach var="product" items="${latestProducts}"
								varStatus="status">
								<div class="card product-card">
									<c:choose>
										<c:when test="${not empty product.imageUrl}">
											<img
												src="${pageContext.request.contextPath}${product.imageUrl}"
												class="product-image" alt="${product.name}">
										</c:when>
										<c:otherwise>
											<div class="product-image">상품 이미지</div>
										</c:otherwise>
									</c:choose>
									<div class="card-body">
										<div class="product-name">${product.name}</div>
										<p class="product-detail">가격 : ${product.price}원</p>									
										<p class="product-detail">구매수 : ${product.purchaseCount}</p>
										<p class="product-detail">등록날짜 : ${product.regDate}</p>
									</div>
									<div class="seller-info">
										<div class="seller-avatar">${product.seller.name.substring(0,1)}</div>
										<div class="seller-name">${product.seller.name}</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<!-- 샘플 데이터 -->
							<c:forEach begin="1" end="6">
								<div class="card product-card">
									<div class="product-image">상품 이미지</div>
									<div class="card-body">
										<div class="product-name">우리농산물 당근</div>
										<p class="product-detail">가격 : 2025.03.12</p>										
										<p class="product-detail">구매수 :</p>
										<p class="product-detail">등록날짜 : 2025.10.01</p>
									</div>
									<div class="seller-info">
										<div class="seller-avatar">당</div>
										<div class="seller-name">닉네임 당근</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</section>

		<!-- Best Products -->
		<section class="mb-5">
			<h2 class="section-title">Best 상품</h2>
			<div class="product-scroll-container">
				<div class="product-row">
					<c:choose>
						<c:when test="${not empty bestProducts}">
							<c:forEach var="product" items="${bestProducts}"
								varStatus="status">
								<div class="card product-card">
									<c:choose>
										<c:when test="${not empty product.imageUrl}">
											<img
												src="${pageContext.request.contextPath}${product.imageUrl}"
												class="product-image" alt="${product.name}">
										</c:when>
										<c:otherwise>
											<div class="product-image">상품 이미지</div>
										</c:otherwise>
									</c:choose>
									<div class="card-body">
										<div class="product-name">${product.name}</div>
										<p class="product-detail">가격 : ${product.price}원</p>										
										<p class="product-detail">구매수 : ${product.purchaseCount}</p>
										<p class="product-detail">등록날짜 : ${product.regDate}</p>
									</div>
									<div class="seller-info">
										<div class="seller-avatar">${product.seller.name.substring(0,1)}</div>
										<div class="seller-name">${product.seller.name}</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<!-- 샘플 데이터 -->
							<c:forEach begin="1" end="6">
								<div class="card product-card">
									<div class="product-image">상품 이미지</div>
									<div class="card-body">
										<div class="product-name">우리농산물 당근</div>
										<p class="product-detail">가격 : 2025.03.12</p>										
										<p class="product-detail">구매수 :</p>
										<p class="product-detail">등록날짜 : 2025.10.01</p>
									</div>
									<div class="seller-info">
										<div class="seller-avatar">당</div>
										<div class="seller-name">닉네임 당근</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</section>
	</div>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="footer-links text-center mb-2">
				<a href="#">개인정보처리방침</a> <span class="dot"></span> <a href="#">저작권보호정책</a>
				<span class="dot"></span> <a href="#">뷰어다운로드</a> <span class="dot"></span>
				<a href="#">대전폴리텍</a>
			</div>
			<div class="footer-info">[34503] 대전광역시 동구 우암로
				352-21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TEL
				042-670-0600&nbsp;&nbsp;(입학문의 대표번호
				1588-2282)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FAX 042-670-0519
			</div>
			<div class="footer-info">COPYRIGHT 2010 BY KOREA POLYTECHNICS.
				ALL RIGHTS RESERVED.</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>