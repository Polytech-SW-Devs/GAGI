<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GAGI Market</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
	color: inherit; /* 링크 클릭 시 색상 변하지 않도록 */
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: white;
}
/* ===== HEADER ===== */
header {
	width: 100%;
	height: 160px;
	background: white;
	border-bottom: 1px solid #DDDDDD;
	position: relative;
}

.header-container {
	max-width: 1920px;
	margin: 0 auto;
	padding: 0 360px;
	height: 100%;
}

.logo {
	position: absolute;
	top: 39px;
	left: 360px;
	display: flex;
	align-items: center;
	gap: 10px;
	text-decoration: none;
}

.logo-svg {
	height: 52px; /* SVG 높이 지정 */
}

.logo-text {
	color: #501845;
	font-size: 24px;
	font-weight: 700;
}

.search-bar {
	position: absolute;
	top: 41px;
	left: 50%;
	transform: translateX(-50%);
	width: 500px;
	height: 48px;
	background: white;
	border: 1px solid #DDDDDD;
	border-radius: 30px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 15px;
}

.search-bar input {
	border: none;
	outline: none;
	flex: 1;
	font-size: 14px;
	color: #555555;
}

.search-btn {
	background: #4076FF;
	color: white;
	border: none;
	border-radius: 20px;
	padding: 6px 15px;
	font-size: 16px;
	cursor: pointer;
}

.top-menu {
	position: absolute;
	top: 10px;
	right: 360px;
	display: flex;
	align-items: center;
	gap: 15px;
	font-size: 14px;
}

.top-menu span {
	cursor: pointer;
}

.divider {
	width: 1px;
	height: 9px;
	background: #DDDDDD;
}

.category-menu {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	gap: 30px;
	font-size: 18px;
}

        .category-menu a.category-link { /* 새로운 클래스명 사용 */
            text-decoration: none;
            color: #0000000; /* 텍스트 색상 지정 */
            display: flex; /* 아이콘과 텍스트를 정렬하기 위해 */
            flex-direction: row; /* 가로 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            gap: 5px; /* 아이콘과 텍스트 사이 간격 */
            font-size: 18px;
            cursor: pointer;
            padding: 5px 0; /* 클릭 영역 확보 */
        }

        .category-menu a.category-link img.category-icon-img { /* 이미지 아이콘 스타일 */
            width: 30px; /* 적절한 크기 지정 */
            height: 30px;
            object-fit: contain;
        }
.header-icons {
	position: absolute;
	top: 50px;
	right: 360px;
	display: flex;
	gap: 20px;
}

.icon {
	font-size: 26px;
	color: black;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<div class="header-container">
			<a href="${pageContext.request.contextPath}/" class="logo"> <img
				src="${pageContext.request.contextPath}/images/gagi_logo.svg"
				alt="가지 마켓 로고" class="logo-svg">
			</a>

			<form action="${pageContext.request.contextPath}/search" method="get" class="search-bar">
				<input type="text" name="keyword" placeholder="검색어를 입력해주세요">
				<button type="submit" class="search-btn">검색</button>
			</form>

			<div class="top-menu">
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
						<span><a href="${pageContext.request.contextPath}/join">회원가입</a></span>
						<div class="divider"></div>
						<span><a href="${pageContext.request.contextPath}/login">로그인</a></span>
					</c:when>
					<c:otherwise>
						<span><a href="${pageContext.request.contextPath}/logout">로그아웃</a></span>
					</c:otherwise>
				</c:choose>
				<div class="divider"></div>
				<span><a
					href="${pageContext.request.contextPath}/customer-center">고객센터</a></span>
			</div>

            <div class="category-menu">
                <a href="${pageContext.request.contextPath}/category/" class="menu-item category-link">
                    <img src="${pageContext.request.contextPath}/images/category/category_all.png" alt="전체 카테고리" class="category-icon-img">
                    <span>전체</span>
                </a>
                <c:forEach items="${categories}" var="category">
                    <a href="${pageContext.request.contextPath}/category/${category.categoryId}" class="menu-item category-link">
                        <c:choose>
                            <c:when test="${category.name eq '농산물'}">
                                <img src="${pageContext.request.contextPath}/images/category/category_fruit.png" alt="${category.name}" class="category-icon-img">
                            </c:when>
                            <c:when test="${category.name eq '수산물'}">
                                <img src="${pageContext.request.contextPath}/images/category/category_fish.png" alt="${category.name}" class="category-icon-img">
                            </c:when>
                            <c:when test="${category.name eq '잡곡류'}">
                                <img src="${pageContext.request.contextPath}/images/category/category_grain.png" alt="${category.name}" class="category-icon-img">
                            </c:when>
                            <c:when test="${category.name eq '축산물'}">
                                <img src="${pageContext.request.contextPath}/images/category/category_meat.png" alt="${category.name}" class="category-icon-img">
                            </c:when>
                           
                        </c:choose>
                        <span>${category.name}</span>
                    </a>
                </c:forEach>
            </div>
			<div class="header-icons">
				<c:choose>
					<c:when test="${empty sessionScope.loginUser}">
						<a href="${pageContext.request.contextPath}/login"> <i
							class="fa-solid fa-user icon"></i>
						</a>
						<a href="${pageContext.request.contextPath}/login"> <i
							class="fa-solid fa-cart-shopping icon"></i>
						</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/mypage"> <i
							class="fa-solid fa-user icon"></i>
						</a>
						<a
							href="${pageContext.request.contextPath}/mycart/view/${loginUser.id}">
							<i class="fa-solid fa-cart-shopping icon"></i>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>