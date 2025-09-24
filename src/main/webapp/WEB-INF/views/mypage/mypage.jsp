<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지 마켓 - 마이페이지</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Inter', sans-serif;
	background: white;
	min-height: 100vh;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 40px;
	border-bottom: 1px solid #ddd;
}

.logo {
	display: flex;
	align-items: center;
	gap: 15px;
}

.logo-icon {
	width: 60px;
	height: 60px;
	background: #61852D;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

.logo-icon::before {
	content: '';
	width: 35px;
	height: 40px;
	background: #61852D;
	border-radius: 50% 50% 50% 50%/60% 60% 40% 40%;
}

.logo-text {
	font-size: 48px;
	font-weight: 400;
	color: #501845;
}

.header-buttons {
	display: flex;
	gap: 15px;
}

.btn {
	padding: 12px 25px;
	border: none;
	border-radius: 25px;
	font-size: 14px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.btn-logout {
	background: #61852D;
	color: white;
}

.btn-cart {
	background: #501845;
	color: white;
}

.btn:hover {
	opacity: 0.8;
	transform: translateY(-1px);
}

.container {
	max-width: 1400px;
	margin: 0 auto;
	padding: 40px 20px;
}

.sidebar {
	position: fixed;
	left: 300px;
	top: 50%;
	transform: translateY(-50%);
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.sidebar h2 {
	font-size: 28px;
	font-weight: 500;
	margin-bottom: 30px;
	text-align: center;
	color: #333;
}

.sidebar-menu {
	list-style: none;
}

.sidebar-menu li {
	margin-bottom: 15px;
}

.sidebar-menu a {
	display: block;
	padding: 12px 20px;
	text-decoration: none;
	color: #333;
	font-size: 18px;
	font-weight: 500;
	border-radius: 8px;
	transition: all 0.3s ease;
}

.sidebar-menu a:hover {
	background: #f5f5f5;
	color: #501845;
	transform: translateX(5px);
}

.main-content {
	margin-left: 300px;
	display: flex;
	flex-direction: column;
	gap: 30px;
}

.profile-section {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.user-profile {
	background: #494041;
	color: white;
	padding: 40px;
	border-radius: 15px;
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.user-info h3 {
	color: #A46550;
	font-size: 12px;
	margin-bottom: 5px;
}

.user-info h2 {
	font-size: 20px;
	margin-bottom: 30px;
}

.user-details {
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.user-details p {
	font-size: 14px;
	color: white;
}

.edit-section {
	display: flex;
	align-items: center;
}

.edit-btn {
	color: #BDB9BA;
	text-decoration: none;
	font-size: 14px;
	cursor: pointer;
}

.edit-btn:hover {
	color: white;
}

.stats-card {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 40px;
	text-align: center;
	transition: all 0.3s ease;
}

.stats-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.stats-card h3 {
	font-size: 20px;
	margin-bottom: 20px;
	color: #333;
}

.stats-amount {
	font-size: 36px;
	font-weight: 500;
	color: #333;
}

.stats-currency {
	font-size: 16px;
	color: #666;
	margin-left: 5px;
}

.purchase-history {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 30px;
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

.more-link {
	color: #666;
	text-decoration: none;
	font-size: 16px;
	cursor: pointer;
}

.more-link:hover {
	color: #501845;
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

.empty-state {
	text-align: center;
	padding: 60px 20px;
	color: #8E8E8E;
	font-size: 16px;
}

@media ( max-width : 1400px) {
	.sidebar {
		position: static;
		transform: none;
		margin-bottom: 30px;
		width: 100%;
		left: auto;
	}
	.main-content {
		margin-left: 0;
	}
	.profile-section {
		grid-template-columns: 1fr;
	}
}

.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1000;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	padding: 40px;
	border-radius: 15px;
	max-width: 500px;
	width: 90%;
}

.modal h3 {
	margin-bottom: 20px;
	color: #333;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	color: #333;
	font-weight: 500;
}

.form-group input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 14px;
}

.modal-buttons {
	display: flex;
	gap: 10px;
	justify-content: flex-end;
	margin-top: 30px;
}

.btn-modal {
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
}

.btn-cancel {
	background: #ddd;
	color: #333;
}

.btn-confirm {
	background: #501845;
	color: white;
}

.message {
	padding: 15px;
	margin: 20px 0;
	border-radius: 8px;
	text-align: center;
}

.success {
	background: #d4edda;
	color: #155724;
	border: 1px solid #c3e6cb;
}

.error {
	background: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
}
</style>
</head>
<body>
	<header class="header">
		<div class="logo"
			onclick="location.href='${pageContext.request.contextPath}/main.jsp'">
			<div class="logo-icon"></div>
			<div class="logo-text">가지 마켓</div>
		</div>
		<div class="header-buttons">
			<form action="${pageContext.request.contextPath}/logout"
				method="post" style="display: inline;">
				<button type="submit" class="btn btn-logout">로그아웃</button>
			</form>
			<button class="btn btn-cart"
				onclick="location.href='${pageContext.request.contextPath}/cart.jsp'">장바구니</button>
		</div>
	</header>

	<div class="container">
		<aside class="sidebar">
			<h2>마이페이지</h2>
			<ul class="sidebar-menu">
				<li><a href="<c:url value='/mypage/myorder'/>">구매내역</a></li>
				<li><a href="<c:url value='/mypage/mysale'/>" class="active">판매내역</a></li>
				<li><a href="#">개인정보 수정</a></li>
				<li><a href="<c:url value='/mypage/myarticle'/>">내 게시글 보기</a></li>
				<li><a href="#">회원탈퇴</a></li>
			</ul>
		</aside>

		<main class="main-content">
			<section class="profile-section">
				<div class="user-profile">
					<div class="user-info">
						<h3>${view.username}</h3>
						<h2>${view.nickname}님 환영합니다</h2>
						<div class="user-details">
							<p>전화: ${view.phone}</p>
							<p>이메일: ${view.email}</p>
						</div>
					</div>
					<div class="edit-section">
						<a href="<c:url value='/mypage/myUpdate'/>" class="edit-btn">수정 ></a>
					</div>
				</div>

				<div class="stats-card">
					<h3>총 구매 금액</h3>
					<span class="stats-amount"><fmt:formatNumber value="${view.totalPurchase}" pattern="#,##0" /></span> <span
						class="stats-currency">원</span>
				</div>
			</section>

			<section class="stats-card">
				<h3>총 판매 금액</h3>
				<span class="stats-amount"><fmt:formatNumber value="${view.totalSales}" pattern="#,##0" /></span> <span
					class="stats-currency">원</span>
			</section>

			<section class="purchase-history">
				<div class="history-header">
					<h3>최근 구매내역</h3>
					<a href="<c:url value='/mypage/myorder'/>" class="more-link">+more</a>
				</div>

				<div class="table-container">
					<table>
						<thead>
							<tr>
								<th>주문일자</th>
								<th>상품정보</th>
								<th>수량</th>
								<th>총 가격</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty view.recentOrders}">
								<tr>
									<td colspan="5" class="empty-state">최근 구매 내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="order" items="${view.recentOrders}">
                                    <tr>
                                        <td><fmt:formatDate value="${order.createdAtDate}" pattern="yyyy-MM-dd" /></td>
                                        <td>
                                            <a href="<c:url value='/items/${order.itemId}'/>">
                                                <img src="<c:url value='${order.imageUrl}'/>"
                                                alt="${order.title}"
                                                style="width: 80px; height: 80px; vertical-align: middle;">
                                                <span>${order.title}</span>
                                            </a>
                                        </td>
                                        <td>${order.amount}개</td>
                                        <td><fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />원</td>
                                        <td>${order.orderStatus}</td>
                                    </tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</main>
	</div>

	<script>
		
	</script>
</body>
</html>