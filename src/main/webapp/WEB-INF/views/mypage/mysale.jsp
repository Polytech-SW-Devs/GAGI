<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 판매내역</title>
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

.sidebar {
	background: white;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	width: 250px;
	height: fit-content;
	position: sticky;
	top: 20px;
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

.sidebar-menu a.active {
	background: #f5f5f5;
	color: #501845;
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

/* 주문번호 버튼 스타일 */
.order-number-link {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	padding: 10px 18px;
	background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
	color: white;
	text-decoration: none;
	border-radius: 10px;
	font-weight: 600;
	font-size: 15px;
	transition: all 0.3s ease;
	box-shadow: 0 2px 8px rgba(80, 24, 69, 0.3);
	letter-spacing: 0.5px;
	min-width: 80px;
}

.order-number-link:hover {
	background: linear-gradient(135deg, #6a1f5a 0%, #501845 100%);
	transform: translateY(-2px) scale(1.05);
	box-shadow: 0 4px 12px rgba(80, 24, 69, 0.4);
	color: white;
	text-decoration: none;
}

.order-number-link:active {
	transform: translateY(0) scale(1);
	box-shadow: 0 2px 6px rgba(80, 24, 69, 0.3);
}

.order-number-link::before {
	content: '#';
	margin-right: 2px;
	opacity: 0.8;
}

/* 상태 선택 셀렉트 박스 */
.status-select {
	padding: 8px 12px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 14px;
	background: white;
	cursor: pointer;
	transition: all 0.3s ease;
}

.status-select:hover:not(:disabled) {
	border-color: #501845;
}

.status-select:disabled {
	background: #f5f5f5;
	cursor: not-allowed;
	opacity: 0.6;
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
	
	table {
		font-size: 14px;
	}
	
	th, td {
		padding: 10px 5px;
	}
	
	.order-number-link {
		padding: 8px 14px;
		font-size: 13px;
		min-width: 70px;
	}
}
</style>

<script>
const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/mypage/mysale.js"></script>
</head>
<body>
    <%@ include file="../templete/header.jsp" %>

    <main>
        <div class="container">
            <aside class="sidebar">
                <h2>마이페이지</h2>
                <ul class="sidebar-menu">
                    <li><a href="<c:url value='/mypage/myorder'/>">구매내역</a></li>
                    <li><a href="<c:url value='/mypage/mysale'/>" class="active">판매내역</a></li>
                    <li><a href="<c:url value='/mypage/delevery/addressList'/>">배달자 관리</a></li>
                    <li><a href="<c:url value='/product/list'/>">내 게시글 보기</a></li>
                    <li><a href="#">회원탈퇴</a></li>
                </ul>
            </aside>

            <div class="main-content">
                <section class="purchase-history">
                    <div class="history-header">
                        <h3>판매 내역</h3>
                    </div>

                    <!-- 주문 상태 필터 버튼 -->
                    <div class="filter-buttons">
                        <a href="<c:url value='/mypage/mysale'/>" class="filter-btn ${empty param.orderStatus ? 'active' : ''}">전체</a>
                        <a href="<c:url value='/mypage/mysale?orderStatus=입금준비'/>" class="filter-btn ${param.orderStatus == '입금준비' ? 'active' : ''}">입금준비</a>
                        <a href="<c:url value='/mypage/mysale?orderStatus=입금완료'/>" class="filter-btn ${param.orderStatus == '입금완료' ? 'active' : ''}">입금완료</a>
                        <a href="<c:url value='/mypage/mysale?orderStatus=배송중'/>" class="filter-btn ${param.orderStatus == '배송중' ? 'active' : ''}">배송중</a>
                        <a href="<c:url value='/mypage/mysale?orderStatus=배송완료'/>" class="filter-btn ${param.orderStatus == '배송완료' ? 'active' : ''}">배송완료</a>
                        <a href="<c:url value='/mypage/mysale?orderStatus=취소'/>" class="filter-btn ${param.orderStatus == '취소' ? 'active' : ''}">취소</a>
                    </div>

                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th style="width: 10%;">주문번호</th>
                                    <th style="width: 15%;">주문일자</th>
                                    <th>상품명</th>
                                    <th style="width: 8%;">수량</th>
                                    <th style="width: 15%;">총 가격</th>
                                    <th style="width: 12%;">주문상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="6" class="empty-state">
                                            <i>📦</i>
                                            <div>판매 내역이 없습니다</div>
                                        </td>
                                    </tr>
                                </c:if>

                                <c:forEach var="order" items="${list}">
                                    <tr>
                                        <td class="align-middle">
                                            <a href="javascript:void(0);" onclick="window.open('<c:url value='/mypage/mysaleDetail/${order.id}'/>', '_blank', 'width=750,height=800');" class="order-number-link">${order.id}</a>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${order.createdAtDate}" pattern="yyyy-MM-dd HH:mm" />
                                        </td>
                                        <td>${order.title}</td>
                                        <td>${order.amount}개</td>
                                        <td><fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />원</td>
                                        <td>
                                            <select class="status-select" data-order-id="${order.id}" data-current-status="${order.orderStatus}"
                                            ${order.orderStatus == '취소' ? 'disabled' : ''}>
                                                <option value="입금준비" ${order.orderStatus == '입금준비' ? 'selected' : ''}>입금준비</option>
                                                <option value="입금완료" ${order.orderStatus == '입금완료' ? 'selected' : ''}>입금완료</option>
                                                <option value="배송중" ${order.orderStatus == '배송중' ? 'selected' : ''}>배송중</option>
                                                <option value="배송완료" ${order.orderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
                                                <option value="취소" ${order.orderStatus == '취소' ? 'selected' : ''}>취소</option>
                                            </select>
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