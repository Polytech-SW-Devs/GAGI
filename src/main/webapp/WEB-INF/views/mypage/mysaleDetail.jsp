<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 상세 정보</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            min-height: 100vh;
            padding: 0;
            margin: 0;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 750px;
            height: 800px;
            background: linear-gradient(to bottom, #ffffff 0%, #f8f9fa 100%);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
            overflow-y: auto;
            animation: slideUp 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            position: relative;
        }
        
        .container::-webkit-scrollbar {
            width: 8px;
        }

        .container::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .container::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
            border-radius: 4px;
        }

        .container::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, #6a1f5a 0%, #8b2f6f 100%);
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header {
            background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
        }

        .header h1 {
            font-size: 20px;
            font-weight: 600;
            letter-spacing: -0.5px;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, #f39c12, #e74c3c, #9b59b6, #3498db);
        }

        .close-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .close-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: rotate(90deg);
        }

        .section {
            border-bottom: 1px solid #f0f0f0;
        }

        .section:last-child {
            border-bottom: none;
        }

        .section-header {
            background: linear-gradient(to right, #f8f9fa, #ffffff);
            padding: 12px 20px;
            font-size: 15px;
            font-weight: 600;
            color: #501845;
            border-left: 3px solid #501845;
            margin: 0;
        }

        .section-content {
            padding: 18px 20px;
        }

        .info-row {
            display: flex;
            align-items: flex-start;
            margin-bottom: 12px;
        }

        .info-row:last-child {
            margin-bottom: 0;
        }

        .info-label {
            width: 110px;
            font-weight: 600;
            color: #555;
            flex-shrink: 0;
            font-size: 13px;
        }

        .info-value {
            flex: 1;
            color: #333;
            font-size: 13px;
            line-height: 1.5;
        }

        /* 거래 방식 스타일 */
        .delivery-method {
            display: flex;
            gap: 10px;
        }

        .method-item {
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 6px 12px;
            background: #f8f9fa;
            border-radius: 6px;
            transition: all 0.3s ease;
            font-size: 13px;
        }

        .method-item.active {
            background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
            color: white;
        }

        .method-item input[type="radio"] {
            display: none;
        }

        .method-item label {
            font-size: 13px;
            font-weight: 500;
            cursor: default;
        }

        .method-item.active label {
            color: white;
        }

        .checkmark {
            color: #27ae60;
            font-size: 14px;
            font-weight: bold;
        }

        .method-item.active .checkmark {
            color: #fff;
        }

        /* 주문번호 강조 */
        .order-number {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 5px 12px;
            background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
            color: white;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        .order-number::before {
            content: '#';
            opacity: 0.8;
        }

        /* 총 가격 섹션 */
        .price {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            margin: 0;
        }

        .price-label {
            font-size: 15px;
            font-weight: 600;
            color: #555;
        }

        .price-value {
            font-size: 24px;
            font-weight: 700;
            color: #501845;
            letter-spacing: -1px;
        }

        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #999;
            font-size: 14px;
        }

        .empty-state::before {
            content: '📦';
            display: block;
            font-size: 40px;
            margin-bottom: 10px;
        }

        /* 배송지 주소 강조 */
        .address-text {
            line-height: 1.6;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 6px;
            border-left: 3px solid #501845;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <button class="close-btn" onclick="window.close()">×</button>
            <h1>판매 상세 내역</h1>
        </div>

        <c:if test="${not empty item}">
            <!-- 주문 기본 정보 -->
            <div class="section">
                <div class="section-content">
                    <div class="info-row">
                        <div class="info-label">거래 방식</div>
                        <div class="info-value">
                            <div class="delivery-method">
                                <div class="method-item ${item.transactionType == '배송' ? 'active' : ''}">
                                    <input type="radio" name="delivery_method" value="delivery" <c:if test="${item.transactionType == '배송'}">checked</c:if> disabled>
                                    <label>배송</label>
                                    <c:if test="${item.transactionType == '배송'}"><span class="checkmark">✓</span></c:if>
                                </div>
                                <div class="method-item ${item.transactionType == '직거래' ? 'active' : ''}">
                                    <input type="radio" name="delivery_method" value="direct" <c:if test="${item.transactionType == '직거래'}">checked</c:if> disabled>
                                    <label>직거래</label>
                                    <c:if test="${item.transactionType == '직거래'}"><span class="checkmark">✓</span></c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">주문번호</div>
                        <div class="info-value">
                            <span class="order-number">${item.id}</span>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">주문일자</div>
                        <div class="info-value"><fmt:formatDate value="${item.createdAtDate}" pattern="yyyy년 MM월 dd일 HH:mm" /></div>
                    </div>
                </div>
            </div>

            <!-- 구매자 정보 섹션 -->
            <div class="section">
                <h2 class="section-header">구매자 정보</h2>
                <div class="section-content">
                    <div class="info-row">
                        <div class="info-label">구매자 이름</div>
                        <div class="info-value">${item.username}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">구매자 연락처</div>
                        <div class="info-value">${item.phone}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">구매자 이메일</div>
                        <div class="info-value">${item.email}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">결제 수단</div>
                        <div class="info-value">${item.paymentMethod}</div>
                    </div>
                </div>
            </div>

            <!-- 배송지 정보 섹션 -->
            <div class="section">
                <h2 class="section-header">배송지 정보</h2>
                <div class="section-content">
                    <div class="info-row">
                        <div class="info-label">수령인</div>
                        <div class="info-value">${item.recipientName}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">연락처</div>
                        <div class="info-value">${item.recipientPhone}</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">배송지</div>
                        <div class="info-value">
                            <div class="address-text">
                                (${item.deliveryZipcode})<br>
                                ${item.deliveryAddressMain}<br>
                                ${item.deliveryAddressDetail}
                            </div>
                        </div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">배송메모</div>
                        <div class="info-value">${not empty item.deliveryMemo ? item.deliveryMemo : '-'}</div>
                    </div>
                </div>
            </div>

            <!-- 총 가격 -->
            <div class="price">
                <span class="price-label">판매자 정산 금액</span>
                <span class="price-value"><fmt:formatNumber value="${item.totalPrice}" pattern="#,##0" />원</span>
            </div>

        </c:if>

        <c:if test="${empty item}">
            <div class="section-content">
                <div class="empty-state">
                    <p>주문 정보를 찾을 수 없거나<br>조회할 권한이 없습니다.</p>
                </div>
            </div>
        </c:if>
    </div>

    <script>
        // ESC 키로 창 닫기
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                window.close();
            }
        });
    </script>
</body>
</html>