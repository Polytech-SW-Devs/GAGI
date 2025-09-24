<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 상세 정보</title>
    <style>
        body {
            font-family: 'Malgun Gothic', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .checkmark {
            color: #27ae60;
            font-size: 16px;
            font-weight: bold;
        }
        .delivery-method {
            display: flex;
            gap: 20px;
        }
        .method-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .method-item input[type="radio"] {
            transform: scale(1.2);
        }
        .method-item label {
            font-size: 16px;
            color: #2c3e50;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }
        .section {
            border-bottom: 2px solid #ecf0f1;
            padding: 0;
        }
        .section:last-child {
            border-bottom: none;
        }
        .section-header {
            background-color: #34495e;
            color: white;
            padding: 15px 20px;
            font-size: 18px;
            font-weight: bold;
            margin: 0;
        }
        .section-content {
            padding: 20px;
        }
        .info-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            min-height: 30px;
        }
        .info-row:last-child {
            margin-bottom: 0;
        }
        .info-label {
            width: 140px;
            font-weight: bold;
            color: #34495e;
            flex-shrink: 0;
        }
        .info-value {
            flex: 1;
            color: #2c3e50;
            font-size: 16px;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .items-table th, .items-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .items-table th {
            background-color: #f2f2f2;
        }
        .price {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 28px;
            font-weight: bold;
            color: #c0392b;
            padding: 20px;
            background-color: #f8f9fa;
            margin: 0;
        }
    </style>
    <jsp:include page="../templete/logo.jsp"></jsp:include>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>판매 상세 내역</h1>
        </div>

        <c:if test="${not empty order}">
            <!-- 주문 기본 정보 -->
            <div class="section">
                <div class="section-content">
                    <div class="info-row">
                        <div class="info-label">거래 방식:</div>
                        <div class="info-value">
                            <div class="delivery-method">
                                <div class="method-item">
                                    <input type="radio" name="delivery_method" value="delivery" <c:if test="${order.transactionType == '배송'}">checked</c:if> disabled>
                                    <label>배송</label>
                                    <c:if test="${order.transactionType == '배송'}"><span class="checkmark">✓</span></c:if>
                                </div>
                                <div class="method-item">
                                    <input type="radio" name="delivery_method" value="direct" <c:if test="${order.transactionType == '직거래'}">checked</c:if> disabled>
                                    <label>직거래</label>
                                    <c:if test="${order.transactionType == '직거래'}"><span class="checkmark">✓</span></c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">주문번호:</div>
                        <div class="info-value">${order.orderId}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">주문일자:</div>
                        <div class="info-value">${order.createdAtFormatted}</div>
                    </div>
                </div>
            </div>

            <!-- 판매 상품 정보 -->
            <div class="section">
                <h2 class="section-header">판매 상품 정보</h2>
                <div class="section-content">
                    <table class="items-table">
                        <thead>
                            <tr>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>가격</th>
                                <th>주문상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${order.orderItems}">
                                <tr>
                                    <td>${item.itemName}</td>
                                    <td>${item.quantity}개</td>
                                    <td><fmt:formatNumber value="${item.totalPrice}" pattern="#,##0" />원</td>
                                    <td>${item.orderStatus}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 구매자 정보 섹션 -->
            <div class="section">
                <h2 class="section-header">구매자 정보</h2>
                <div class="section-content">
                    <div class="info-row">
                        <div class="info-label">구매자 이름</div>
                        <div class="info-value">${order.buyerName}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">구매자 연락처</div>
                        <div class="info-value">${order.buyerPhone}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">구매자 이메일</div>
                        <div class="info-value">${order.buyerEmail}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">결제 수단</div>
                        <div class="info-value">${order.paymentMethod}</div>
                    </div>
                </div>
            </div>

            <!-- 배송지 정보 섹션 -->
            <div class="section">
                <h2 class="section-header">배송지 정보</h2>
                <div class="section-content">
                    <div class="info-row">
                        <div class="info-label">수령인</div>
                        <div class="info-value">${order.recipientName}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">연락처</div>
                        <div class="info-value">${order.recipientPhone}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">배송지</div>
                        <div class="info-value">(${order.deliveryZipcode}) ${order.deliveryAddressMain} ${order.deliveryAddressDetail}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">배송메모</div>
                        <div class="info-value">${order.deliveryMemo}</div>
                    </div>
                </div>
            </div>

            <!-- 총 가격 -->
            <div class="price">
                <span>판매자 정산 금액</span>
                <span><fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />원</span>
            </div>

        </c:if>

        <c:if test="${empty order}">
            <div class="section-content">
                <p>주문 정보를 찾을 수 없거나 조회할 권한이 없습니다.</p>
            </div>
        </c:if>
    </div>
</body>
</html>
