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
	padding: 50px 360px;
}

/* Hero Section */
.hero-section {
	display: flex;
	gap: 20px;
	margin-bottom: 80px;
}

        .hero-banner {
            width: 880px;
            height: 450px;
            background: linear-gradient(135deg, #e8f5e9 0%, #c8e6c9 100%);
            border-radius: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            overflow: hidden; /* 이미지의 border-radius가 부모에 맞춰 잘리도록 */
        }
        .hero-text {
            width: 100%; /* 부모 hero-banner의 가로를 채움 */
            height: 100%; /* 부모 hero-banner의 세로를 채움 */
            display: flex; /* 내부 이미지를 중앙 정렬하기 위해 flex 사용 */
            align-items: center; /* 세로 중앙 정렬 */
            justify-content: center; /* 가로 중앙 정렬 */
        }
        .hero-text .highlight {
            font-weight: 700;
        }
        .hero-text img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* 이미지가 영역을 가득 채우도록 */
            border-radius: 30px; /* hero-banner의 border-radius와 맞춤 */
        }
.sidebar {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.login-box {
	width: 300px;
	height: 196px;
	background: #4076FF;
	border-radius: 20px;
	padding: 36px 20px;
	color: white;
	text-align: center;
}

.login-box h3 {
	font-size: 20px;
	font-weight: 300;
	margin-bottom: 20px;
}

.login-box .bold {
	font-weight: 500;
}

.login-box button {
	width: 260px;
	height: 51px;
	background: white;
	color: #4076FF;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: 500;
	cursor: pointer;
	margin-top: 15px;
}

.menu-box {
	width: 300px;
	height: 234px;
	background: #F8F8F8;
	border-radius: 20px;
	padding: 30px;
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 40px 80px;
}

.menu-box a.menu-item {
	text-decoration: none;
	color: inherit;
}

.menu-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
	font-size: 16px;
	cursor: pointer;
}

.menu-icon {
	font-size: 24px;
	color: fffff; /* 아이콘 색상 지정 */
	width: 24px;
	height: 24px;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* Products Section */
.products-section {
	margin-bottom: 80px;
}

.section-title {
	font-size: 30px;
	font-weight: 700;
	margin-bottom: 30px;
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

        .product-card {
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
	margin-bottom: 5px;
}

.product-price {
	font-size: 20px;
	color: #555555;
	margin-bottom: 5px;
}

.product-meta {
	font-size: 16px;
	color: #555555;
	margin-bottom: 5px;
}

.seller-info {
	display: flex;
	align-items: center;
	gap: 5px;
	font-size: 14px;
	margin-top: 10px;
}

.seller-avatar {
	width: 24px;
	height: 24px;
	background: #ddd;
	border-radius: 50%;
}

.rating {
	color: #FFA600;
	margin-left: 5px;
}

/* Trust Section */
.trust-section {
	background: #F0F5F7;
	margin: 0 -360px;
	padding: 80px 360px;
	text-align: center;
}

.trust-title {
	font-size: 48px;
	color: #501845;
	margin-bottom: 50px;
}

.trust-title .bold {
	font-weight: 700;
}

.trust-features {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.trust-item {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 20px; /* 카드와 텍스트 사이 간격 */
	cursor: pointer;
}

.trust-card {
	background: white;
	border-radius: 20px;
	padding: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.trust-icon {
	width: 180px;
	height: 184px;
	object-fit: cover; /* 이미지가 영역에 맞게 조절되도록 추가 */
}

.trust-text {
	font-size: 24px;
}
</style>
<script>
	const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
	<%@ include file="templete/header.jsp" %>

	<!-- ===== MAIN ===== -->
	<main>
		<!-- Hero Section -->
		<section class="hero-section">
			<div class="hero-banner">
				<div class="hero-text">
					<img src="${pageContext.request.contextPath}/images/main1.png"
							alt="소비자와 생산자가 직접 거래하는 가지마켓">
				</div>
			</div>
			            <div class="sidebar">
			                <c:choose>
			                    <c:when test="${empty sessionScope.loginUser}">
			                        <div class="login-box">
			                            <h3>가지마켓에 회원가입 후<br><span class="bold">로그인을 하세요</span></h3>
			                            <button id="loginBtn">로그인</button>
			                        </div>
			                    </c:when>
			                    <c:otherwise>
			                        <div class="login-box">
			                            <h3>
			                                <span class="bold">${sessionScope.loginUser.username}님</span><br>
			                                환영합니다!
			                            </h3>
			                            <button id="mypageBtn">마이페이지</button>
			                        </div>
			                    </c:otherwise>
			                </c:choose>
			                <div class="menu-box">
			                    <a href="${pageContext.request.contextPath}/notice/list" class="menu-item">
			                        <i class="fa-solid fa-bullhorn menu-icon"></i>
			                        <span>공지사항</span>
			                    </a>
			                    <a href="${pageContext.request.contextPath}/review/list" class="menu-item">
			                        <i class="fa-solid fa-comments menu-icon"></i>
			                        <span>후기</span>
			                    </a>
			                    <a href="${pageContext.request.contextPath}/inquiry/list" class="menu-item">
			                        <i class="fa-solid fa-circle-question menu-icon"></i>
			                        <span>Q&A</span>
			                    </a>
			                    <div class="menu-item">
			                    <a href="${pageContext.request.contextPath}/report/list" class="menu-item">
			                        <i class="fa-solid fa-triangle-exclamation menu-icon"></i>
			                        <span>신고</span>
			                     </a>
			                    </div>
			                </div>
			            </div>
		</section>

		<!-- Latest Products -->
		<section class="products-section">
			<h2 class="section-title">최신상품</h2>
			<div class="products-grid">
				<c:forEach items="${latestItems}" var="item">
					<div class="product-card" data-item-id="${item.id}">
						<div class="product-image">
							<c:if test="${not empty item.filename}">
								<img src="${pageContext.request.contextPath}/upload/${item.filename}"
									style="width: 100%; height: 100%; object-fit: cover; border-radius: 15px;">
							</c:if>
						</div>
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
								<span>${item.sellerName}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>

		<!-- Trust Section -->
		<div class="trust-section">
			<h2 class="trust-title">
				가지마켓에서 신선선한 상품을<br> <span class="bold"> 보다 저렴하게 만나보세요</span>
			</h2>
			<div class="trust-features">
				<div class="trust-item">
					<div class="trust-card">
						<img src="${pageContext.request.contextPath}/images/apple.png"
							alt="제철 상품" class="trust-icon">
					</div>
					<div class="trust-text">제철 상품</div>
				</div>
				<div class="trust-item">
					<div class="trust-card">
						<img src="${pageContext.request.contextPath}/images/banana.png"
							alt="마트보다 저렴한 상품" class="trust-icon">
					</div>
					<div class="trust-text">마트보다 저렴한 상품</div>
				</div>
				<div class="trust-item">
					<div class="trust-card">
						<img src="${pageContext.request.contextPath}/images/meat.png"
							alt="중간 유통과정 없는 상품" class="trust-icon">
					</div>
					<div class="trust-text">중간 유통과정 없는 상품</div>
				</div>
			</div>
		</div>

		<!-- Best Products -->
		<section class="products-section" style="margin-top: 80px;">
			<h2 class="section-title">Best 상품</h2>
			<div class="products-grid">
				<c:forEach items="${topItems}" var="item">
					<div class="product-card" data-item-id="${item.id}">
						<div class="product-image">
							<c:if test="${not empty item.filename}">
								<img
									src="${pageContext.request.contextPath}/upload/${item.filename}"
									alt="${item.title}"
									style="width: 100%; height: 100%; object-fit: cover; border-radius: 15px;">
							</c:if>
						</div>
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
								<span>${item.sellerName}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</main>

	<!-- ===== FOOTER ===== -->
	<jsp:include page="templete/footer.jsp"></jsp:include>
</body>
</html>