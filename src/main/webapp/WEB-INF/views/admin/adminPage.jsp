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
<title>가지마켓 - 관리자 페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr@latest/dist/l10n/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.search-filter-box {
    background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 30px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
    border: 1px solid #e9ecef;
}

.filter-group, .search-group {
    display: flex;
    gap: 12px;
    align-items: center;
    margin-bottom: 15px;
}

.filter-group:last-child, .search-group:last-child {
    margin-bottom: 0;
}

.filter-group label {
    font-weight: 500;
    color: #495057;
    font-size: 14px;
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    padding: 8px 16px;
    background: white;
    border-radius: 6px;
    border: 1px solid #dee2e6;
    transition: all 0.3s ease;
}

.filter-group label:hover {
    background: #f8f9fa;
    border-color: #501845;
}

.filter-group input[type="checkbox"] {
    width: 18px;
    height: 18px;
    cursor: pointer;
    accent-color: #501845;
}

.filter-group input[type="text"], 
.search-group input[type="text"], 
.search-group select {
    padding: 10px 14px;
    border: 1px solid #dee2e6;
    border-radius: 6px;
    font-size: 14px;
    background: white;
    transition: all 0.3s ease;
    min-width: 120px;
}

.filter-group input[type="text"]:focus, 
.search-group input[type="text"]:focus, 
.search-group select:focus {
    outline: none;
    border-color: #501845;
    box-shadow: 0 0 0 3px rgba(80, 24, 69, 0.1);
}

.search-group select {
    min-width: 100px;
    cursor: pointer;
}

.search-group input[type="text"] {
    flex: 1;
    min-width: 200px;
}

.filter-group > label:first-child {
    color: #495057;
    font-weight: 600;
    min-width: 60px;
    background: transparent;
    border: none;
    padding: 0;
}

.filter-group > label:first-child:hover {
    background: transparent;
}

.filter-group span {
    color: #6c757d;
    font-weight: 500;
}

.btn-search {
    padding: 10px 24px;
    background: linear-gradient(135deg, #494041 0%, #501845 100%);
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(73, 64, 65, 0.2);
}

.btn-search:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(73, 64, 65, 0.3);
}

.btn-search:active {
    transform: translateY(0);
}

#product-reset-btn {
    background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
}

#product-reset-btn:hover {
    background: linear-gradient(135deg, #5a6268 0%, #343a40 100%);
}

.datepicker {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23495057' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Crect x='3' y='4' width='18' height='18' rx='2' ry='2'%3E%3C/rect%3E%3Cline x1='16' y1='2' x2='16' y2='6'%3E%3C/line%3E%3Cline x1='8' y1='2' x2='8' y2='6'%3E%3C/line%3E%3Cline x1='3' y1='10' x2='21' y2='10'%3E%3C/line%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 12px center;
    background-size: 16px;
    padding-right: 40px;
}

.pagination-container {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px 0;
    gap: 8px;
}

.pagination-container a {
    text-decoration: none;
    color: #333;
    padding: 8px 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.pagination-container a:hover {
    background-color: #f5f5f5;
}

.pagination-container a.active {
    background-color: #494041;
    color: white;
    border-color: #494041;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: white;
	min-height: 100vh;
}

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

.stats-overview {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.stat-card {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 30px;
	text-align: center;
	transition: all 0.3s ease;
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.stat-card.primary {
	background: #494041;
	color: white;
	border-color: #494041;
}

.stat-card h3 {
	font-size: 14px;
	color: #666;
	margin-bottom: 15px;
	font-weight: 400;
}

.stat-card.primary h3 {
	color: #A46550;
}

.stat-card .stat-number {
	font-size: 32px;
	font-weight: 500;
	color: #333;
}

.stat-card.primary .stat-number {
	color: white;
}

.stat-card .stat-label {
	font-size: 14px;
	color: #999;
	margin-left: 5px;
}

.stat-card.primary .stat-label {
	color: #BDB9BA;
}

.dashboard-container {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 30px;
}

.chart-section {
	background: #f9f9f9;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 30px;
}

.chart-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.chart-header h4 {
	font-size: 18px;
	font-weight: 500;
	color: #333;
}

.chart-legend {
	display: flex;
	gap: 20px;
}

.legend-item {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 14px;
	color: #666;
}

.legend-dot {
	width: 12px;
	height: 12px;
	border-radius: 3px;
}

.legend-dot.order {
	background: #7c5cad;
}

.legend-dot.cancel {
	background: #5eb5d4;
}

.chart-wrapper {
	background: white;
	padding: 20px;
	border-radius: 8px;
	height: 350px;
}

.order-process-section {
	background: #f9f9f9;
	padding: 20px;
	border-radius: 10px;
}

.order-process-section h4 {
	font-size: 18px;
	font-weight: 500;
	color: #333;
	margin-bottom: 20px;
}

.process-table {
	background: white;
	border-radius: 8px;
	overflow: hidden;
}

.process-table th,
.process-table td {
	padding: 15px 10px;
	text-align: center;
	font-size: 14px;
}

.process-table th {
	background: #494041;
	color: white;
	font-weight: 500;
}

.process-table tbody tr:hover {
	background: #f5f5f5;
}

.process-table td:first-child {
	text-align: left;
	padding-left: 15px;
}

.process-table td:nth-child(2),
.process-table td:nth-child(3) {
	text-align: right;
	padding-right: 15px;
}

.admin-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 30px;
	transition: all 0.3s ease;
}

.admin-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.section-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.section-header h3 {
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

.table-container table tbody td:nth-child(2) {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    padding: 0;
    height: 90px;
}

.table-container table tbody td:nth-child(2) > a {
    display: flex;
    flex-grow: 1;
    justify-content: flex-start;
    align-items: center;
    height: 100%;
    text-decoration: none;
    color: inherit;
}

th {
	font-weight: 500;
	background: #f9f9f9;
	border-bottom: 2px solid #ddd;
	
}

td a {
	text-decoration: none;
	color: #333;
}

td a:hover {
	color: #501845;
}

.product-info {
	display: inline-flex;
	align-items: center;
}

.product-image {
	width: 60px;
	height: 60px;
	object-fit: cover;
	border-radius: 8px;
}

.product-placeholder {
	width: 60px;
	height: 60px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	border-radius: 8px;
	display: inline-block;
}

.action-links {
	display: flex;
	gap: 10px;
	justify-content: center;
	align-items: center;
}

.action-links a {
	color: #666;
	text-decoration: none;
	font-size: 14px;
}

.action-links a:hover {
	color: #501845;
}

.empty-state {
	text-align: center;
	padding: 60px 20px;
	color: #8E8E8E;
	font-size: 16px;
}

.status-badge {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 14px;
	font-weight: 500;
}

.status-pending {
	background: #fff3cd;
	color: #856404;
}

.status-completed {
	background: #d4edda;
	color: #155724;
}

.status-cancelled {
	background: #f8d7da;
	color: #721c24;
}

@media (max-width: 1600px) {
	main {
		padding: 50px 100px 80px;
	}
	
	.stats-overview {
		grid-template-columns: repeat(2, 1fr);
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
	
	.stats-overview {
		grid-template-columns: 1fr;
	}
	
	.search-filter-box {
		padding: 20px;
	}
	
	.filter-group, .search-group {
		flex-direction: column;
		align-items: stretch;
		gap: 10px;
	}
	
	.filter-group input[type="text"],
	.search-group input[type="text"],
	.search-group select {
		width: 100%;
		min-width: unset;
	}
	
	.btn-search {
		width: 100%;
	}
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
	<script>
		const CONTEXT_PATH = "${pageContext.request.contextPath}";
	</script>
</head>
<body>
	<%@ include file="../templete/header.jsp" %>

	<main>
		<div class="container">
			<!-- 관리자 사이드바 -->
			<jsp:include page="/WEB-INF/views/templete/adminSidebar.jsp" />

			<div class="main-content">
				<div id="dashboard-content">
				

				<!-- 쇼핑몰관리 섹션 -->
				<section class="admin-section">
					<div class="section-header">
						<h3>쇼핑몰관리</h3>
					</div>

					<div class="chart-section">
						<div class="chart-header">
							<h4>주문현황</h4>
							<div class="chart-legend">
								<span class="legend-item"><span class="legend-dot order"></span>주문</span>
								<span class="legend-item"><span class="legend-dot cancel"></span>취소</span>
							</div>
						</div>
						<div class="chart-wrapper">
							<canvas id="orderChart"></canvas>
						</div>
					</div>

					<div class="order-process-section">
						<h4>처리할 주문</h4>
						<table class="process-table">
							<thead>
								<tr>
									<th>상태변경</th>
									<th>건수</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>입금대기 → 입금완료</td>
									<td>1,223</td>
									<td>2,000,156,700</td>
								</tr>
								<tr>
									<td>입금완료 → 배송중</td>
									<td>311</td>
									<td>2,520,896,247</td>
								</tr>
								<tr>
									<td>배송중 → 배송완료</td>
									<td>204</td>
									<td>48,940,100</td>
								</tr>
								<tr>
									<td>배송완료 → 완료</td>
									<td>180</td>
									<td>64,661,200</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
				<!-- 통계 카드 섹션 -->
				<section class="stats-overview">
					<div class="stat-card primary">
						<h3>전체 회원 수</h3>
						<span class="stat-number">1,247</span>
						<span class="stat-label">명</span>
					</div>

					<div class="stat-card">
						<h3>전체 상품 수</h3>
						<span class="stat-number">3,582</span>
						<span class="stat-label">개</span>
					</div>

					<div class="stat-card">
						<h3>전체 주문 수</h3>
						<span class="stat-number">8,964</span>
						<span class="stat-label">건</span>
					</div>

					<div class="stat-card">
						<h3>총 거래 금액</h3>
						<span class="stat-number">254,890,000</span>
						<span class="stat-label">원</span>
					</div>
				</section>
				</div>

				<!-- 최근 등록 상품 섹션 -->
				<section id="product-management-content" class="admin-section" style="display: none;">
					<div class="section-header">
						<h3>최근 등록 상품</h3>
					</div>

					<div class="search-filter-box">
						<div class="filter-group">
							<label><input type="checkbox" id="outOfStock-checkbox"> 재고 0인 상품만 조회</label>
						</div>
						<div class="filter-group">
							<label for="product-start-date">등록일:</label>
							<input type="text" id="product-start-date" class="datepicker" placeholder="시작일">
							<span>~</span>
							<input type="text" id="product-end-date" class="datepicker" placeholder="종료일">
						</div>
						<div class="search-group">
							<select id="product-search-type">
								<option value="1">ID</option>
								<option value="2">상품명</option>
								<option value="3">판매자</option>
							</select>
							<input type="text" id="product-search-keyword" placeholder="검색어를 입력하세요">
							<button id="product-search-btn" class="btn-search">조회</button>
							<button id="product-reset-btn" class="btn-search">초기화</button>
						</div>
					</div>

					<div class="table-container">
						<table>
							<thead>
								<tr>
									<th>ID</th>
									<th>상품정보</th>
									<th>가격</th>
									<th>재고</th>
									<th>판매자</th>
									<th>등록일</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody id="products-tbody">
								<!-- AJAX content will be loaded here -->
							</tbody>
						</table>
					</div>
					<div id="product-pagination" class="pagination-container"></div>
				</section>

				<!-- 최근 가입 회원 섹션 -->
				<section id="member-management-content" class="admin-section" style="display: none;">
					<div class="section-header">
						<h3>최근 가입 회원</h3>
					</div>

					<div class="search-filter-box">
						<div class="filter-group">
							<label for="user-start-date">가입일:</label>
							<input type="text" id="user-start-date" class="datepicker" placeholder="시작일">
							<span>~</span>
							<input type="text" id="user-end-date" class="datepicker" placeholder="종료일">
						</div>
						<div class="search-group">
							<select id="user-search-type">
								<option value="1">ID</option>
								<option value="2">이름</option>
								<option value="3">닉네임</option>
								<option value="4">이메일</option>
								<option value="5">전화번호</option>
							</select>
							<input type="text" id="user-search-keyword" placeholder="검색어를 입력하세요">
							<button id="user-search-btn" class="btn-search">조회</button>
							<button id="user-reset-btn" class="btn-search">초기화</button>
						</div>
					</div>

					<div class="table-container">
						<table>
							<thead>
								<tr>
									<th>회원 ID</th>
									<th>이름</th>
									<th>닉네임</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th>가입일</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody id="members-tbody">
								<!-- AJAX content will be loaded here -->
							</tbody>
						</table>
					</div>
					<div id="user-pagination" class="pagination-container"></div>
				</section>

				<!-- 최근 주문 내역 섹션 -->
				<section id="order-management-content" class="admin-section" style="display: none;">
					<div class="section-header">
						<h3>최근 주문 내역</h3>
					</div>

					<div class="search-filter-box">
						<div class="filter-group">
							<label for="order-start-date">주문일:</label>
							<input type="text" id="order-start-date" class="datepicker" placeholder="시작일">
							<span>~</span>
							<input type="text" id="order-end-date" class="datepicker" placeholder="종료일">
						</div>
						<div class="search-group">
							<select id="order-search-type">
								<option value="1">주문 ID</option>
								<option value="2">주문자</option>
								<option value="3">상품명</option>
							</select>
							<input type="text" id="order-search-keyword" placeholder="검색어를 입력하세요">
							<select id="order-status-filter">
								<option value="">전체 상태</option>
								<option value="입금준비">입금준비</option>
								<option value="입금완료">입금완료</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="취소">취소</option>
							</select>
							<button id="order-search-btn" class="btn-search">조회</button>
							<button id="order-reset-btn" class="btn-search">초기화</button>
						</div>
					</div>

					<div class="table-container">
						<table>
							<thead>
								<tr>
									<th>주문 ID</th>
									<th>주문자</th>
									<th>상품명</th>
									<th>수량</th>
									<th>총 가격</th>
									<th>주문일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody id="orders-tbody">
								<!-- AJAX content will be loaded here -->
							</tbody>
						</table>
					</div>
					<div id="order-pagination" class="pagination-container"></div>
				</section>
			</div>
		</div>
	</main>

<c:if test="${not empty msg}">
	<script>
		alert("${msg}")
	</script>
</c:if>

	<script>
		// Chart.js를 이용한 주문현황 차트
		const ctx = document.getElementById('orderChart').getContext('2d');
		const orderChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: ['03-21 (목)', '03-22 (금)', '03-23 (토)', '03-24 (일)', '03-25 (월)', '03-26 (화)', '03-27 (수)'],
				datasets: [
					{
						label: '주문',
						data: [95000, 198000, 0, 88000, 534000, 158000, 72000],
						backgroundColor: '#7c5cad',
						borderRadius: 5
					},
					{
						label: '취소',
						data: [68000, 0, 0, 0, 79000, 0, 48000],
						backgroundColor: '#5eb5d4',
						borderRadius: 5
					}
				]
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				plugins: {
					legend: {
						display: false
					},
					tooltip: {
						callbacks: {
							label: function(context) {
								let label = context.dataset.label || '';
								if (label) {
									label += ': ';
								}
								label += new Intl.NumberFormat('ko-KR').format(context.parsed.y) + '원';
								return label;
							}
						}
					}
				},
				scales: {
					x: {
						grid: {
							display: false
						}
					},
					y: {
						beginAtZero: true,
						ticks: {
							callback: function(value) {
								return new Intl.NumberFormat('ko-KR').format(value);
							}
						}
					}
				}
			}
		});
	</script>

	<script src="<c:url value='/js/adminPage.js'/>"></script>

	<%@ include file="../templete/footer.jsp" %>
</body>
</html>