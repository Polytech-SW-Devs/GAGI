<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역</title>
    <style>
		.order-row td {
			vertical-align: middle;
		}
	</style>
</head>
<body>
<div class="container">
	<div>
		<div><h3>구매 내역</h3></div>
	</div>
	
	<div>
		<table border="1" class="table table-sm text-center">
			<thead>
				<tr>
					<th>주문일자</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>진행상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty orderHistory}">
					<tr>
						<td colspan="5">주문 내역이 없습니다</td>
					</tr>
				</c:if>
				
				<!-- 1. 주문 목록을 순회하는 바깥쪽 루프 -->
				<c:forEach var="order" items="${orderHistory}">
					<!-- 2. 해당 주문에 속한 상품 목록을 순회하는 안쪽 루프 (varStatus로 루프 상태 확인) -->
					<c:forEach var="item" items="${order.orderItems}" varStatus="loop">
						<tr class="order-row">
							
							<!-- 그룹의 첫번째 아이템일 때만 주문일자 칸을 그림 -->
							<c:if test="${loop.first}">
								<td rowspan="${order.orderItems.size()}">
									<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" />
								</td>
							</c:if>
							
							<!-- 상품 정보 (매번 그림) -->
							<td class="text-start">
								<a href="/items/${item.itemId}">
									<img src="${item.thumbnailUrl}" alt="${item.itemName}" style="width:50px; height:50px; margin-right: 10px;">
									<span>${item.itemName}</span>
								</a>
							</td>
							<td>${item.quantity} 개</td>
							<td><fmt:formatNumber value="${item.totalPrice}" pattern="###,###,###" /> 원</td>
							
							<!-- 그룹의 첫번째 아이템일 때만 진행상태 칸을 그림 -->
							<c:if test="${loop.first}">
								<td rowspan="${order.orderItems.size()}">
									${order.shippingStatus}
								</td>
							</c:if>
							
						</tr>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>