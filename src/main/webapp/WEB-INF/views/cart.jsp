<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    </style>
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
        <!-- 나중에 c:forEach 로 상품 출력 -->
        <tr>
            <td><img src="https://via.placeholder.com/60" class="product-img" alt="상품이미지"></td>
            <td>테스트 상품 1</td>
            <td>10,000원</td>
            <td>1</td>
            <td>10,000원</td>
            <td><a href="#" class="btn btn-danger">삭제</a></td>
        </tr>
        <tr>
            <td><img src="https://via.placeholder.com/60" class="product-img" alt="상품이미지"></td>
            <td>테스트 상품 2</td>
            <td>25,000원</td>
            <td>2</td>
            <td>50,000원</td>
            <td><a href="#" class="btn btn-danger">삭제</a></td>
        </tr>
        </tbody>
    </table>

    <div class="total-box">
        <p>총 결제금액: <span>60,000원</span></p>
        <a href="#" class="btn btn-primary">결제하기</a>
    </div>
</div>
</body>
</html>
