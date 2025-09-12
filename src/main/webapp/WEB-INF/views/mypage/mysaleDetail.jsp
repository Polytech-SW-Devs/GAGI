<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 상세 내역</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { color: #333; }
        .order-info, .item-info { margin-bottom: 15px; padding: 10px; border: 1px solid #eee; border-radius: 5px; }
        .order-info p, .item-info p { margin: 5px 0; }
        .item-list { margin-top: 20px; border-top: 1px solid #eee; padding-top: 10px; }
        .item-list h3 { margin-top: 0; color: #555; }
        .item-detail { border-bottom: 1px dashed #ddd; padding-bottom: 10px; margin-bottom: 10px; }
        .item-detail:last-child { border-bottom: none; }
    </style>
</head>
<body>
    <h2>주문 상세 내역</h2>

    <c:if test="${empty order}">
        <p>주문 정보를 찾을 수 없습니다.</p>
    </c:if>
    <c:if test="${not empty order}">
        <div class="order-info">
            <h3>주문 정보</h3>
            <p><strong>주문 번호:</strong> ${order.id}</p>
            <p><strong>주문자 ID:</strong> ${order.userId}</p>
            <p><strong>거래 유형:</strong> ${order.transactionType}</p>
            <p><strong>총 주문 금액:</strong> <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />원</p>
            <p><strong>결제 수단:</strong> ${order.paymentMethod}</p>
            <p><strong>수령인:</strong> ${order.recipientName} (${order.recipientPhone})</p>
            <p><strong>배송지:</strong> (${order.deliveryZipcode}) ${order.deliveryAddressMain} ${order.deliveryAddressDetail}</p>
                        <p><strong>요청 사항:</strong> ${order.deliveryMemo}</p>
            <p><strong>생성일:</strong> <fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd HH:mm" /></p>
        </div>

        <div class="item-list">
            <h3>주문 상품 목록</h3>
            <c:if test="${empty order.orderItems}">
                <p>주문된 상품이 없습니다.</p>
            </c:if>
            <c:forEach var="orderItem" items="${order.orderItems}">
                <div class="item-detail">
                    <p><strong>상품명:</strong> ${orderItem.item.title}</p>
                    <p><strong>수량:</strong> ${orderItem.quantity}개</p>
                    <p><strong>단가:</strong> <fmt:formatNumber value="${orderItem.price}" pattern="#,##0" />원</p>
                    <p><strong>상품별 총 가격:</strong> <fmt:formatNumber value="${orderItem.quantity * orderItem.price}" pattern="#,##0" />원</p>
                    <p><strong>주문 상품 상태:</strong> ${orderItem.orderStatus}</p>
                </div>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>