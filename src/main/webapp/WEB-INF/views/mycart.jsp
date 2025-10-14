<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <style>
        body {
            font-family: "맑은 고딕", Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 40px auto;
            margin-top: 200px auto 0; /* 위에 헤더 공간 확보 (100px 내려옴) */
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.15);
            padding: 20px;
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        table th {
            background: #501845;
            color: #ffffff;
        }
        .product-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
        }
        .total-box {
            margin-top: 20px;
            text-align: right;
        }
        .total-box span {
            font-size: 18px;
            font-weight: bold;
            color: #222;
        }
        .btn {
            display: inline-block;
            padding: 10px 18px;
            margin-top: 10px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
        }
        .btn-primary {
            background: #007bff;
            color: #fff;
        }
        .btn-danger {
            background: #dc3545;
            color: #fff;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .qty-wrapper {
  display: flex;
  align-items: center;
  justify-content: center; /* 중앙 정렬 */
  gap: 6px; /* 버튼-인풋 사이 여백 균일하게 */
}

.qty-btn {
  font-size: 22px; /* 버튼 내 화살표 크기 */
  width: 28px;      /* 버튼 크기 약간 줄임 */
  height: 28px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background: #f8f8f8;
  cursor: pointer;
  line-height: 1;
  transition: background 0.2s, transform 0.1s;
}

.qty-btn:hover {
  background: #e0e0e0;
  transform: scale(1.05);
}

.qty-input {
  width: 48px;
  text-align: center;
  font-size: 16px;
  padding: 4px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
    </style>
	<script>
		const contextPath = "${pageContext.request.contextPath}";
	</script>
    <script src="${pageContext.request.contextPath}/js/mycart.js"></script>
</head>
<body>
<div class="container">
    <h1>🛒 장바구니</h1>
    <table>
        <thead>
        <tr>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
            <th>합계</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${cartList}">
            <tr data-userid="${item.userId}" data-itemid="${item.itemId}" data-price="${item.price}">
                <!-- 상품 이미지: DB에 없으면 placeholder -->
                <td>
                    <img src="${item.imageUrl != null ? item.imageUrl : 'https://via.placeholder.com/60'}"
                         class="product-img" alt="상품이미지">
                </td>
                <td>${item.itemName}</td>
                <td class="subtotal"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</td>
                <td>
			      <div class="qty-wrapper">
				    <button type="button" class="qty-btn decrease">−</button>
				    <input type="number" class="qty-input" value="${item.quantity}" min="0" />
				    <button type="button" class="qty-btn increase">+</button>
				  </div>
			    </td>
                <td><fmt:formatNumber value="${item.price * item.quantity}" pattern="#,###"/>원?</td>
                <td>
                    <a href="${pageContext.request.contextPath}/mycart/delete?userId=${item.userId}&itemId=${item.itemId}" class="btn btn-danger">삭제</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="total-box">
        <p>총 결제금액:
            <span>
                <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원
            </span>
        </p>
        <a href="#" class="btn btn-primary">결제하기</a>
    </div>
</div>
</body>
</html>
