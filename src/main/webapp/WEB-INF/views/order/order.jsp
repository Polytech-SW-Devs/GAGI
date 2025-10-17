<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>주문서 작성</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath}/resources/js/order.js" defer></script>
</head>
<body>
<div class="container mt-5 mb-5">

  <h2 class="mb-4">🧾 주문서 작성</h2>

  <form id="orderForm" action="${pageContext.request.contextPath}/order/complete" method="post">
    <input type="hidden" name="userId" value="${user.id}" />

    <!-- 주문자 정보 -->
    <section class="mb-4">
      <h4>주문자 정보</h4>
      <div class="mb-2">
        <label>이름</label>
        <input type="text" name="name" class="form-control" value="${user.username}" readonly>
      </div>
      <div class="mb-2">
        <label>이메일</label>
        <input type="text" name="email" class="form-control" value="${user.email}" readonly>
      </div>
      <div class="mb-2">
        <label>연락처</label>
        <input type="text" name="phone" class="form-control" value="${user.phone}">
      </div>
    </section>

    <!-- 배송지 정보 -->
    <section class="mb-4">
      <h4>배송지 정보</h4>
      <div class="mb-2">
        <label>수령인</label>
        <input type="text" name="receiverName" class="form-control" required>
      </div>
      <div class="mb-2">
        <label>주소</label>
        <input type="text" name="address" class="form-control" required>
      </div>
      <div class="mb-2">
        <label>전화번호</label>
        <input type="text" name="receiverPhone" class="form-control" required>
      </div>
    </section>

    <!-- 주문 상품 -->
    <section class="mb-4">
      <h4>주문 상품</h4>
      <table class="table table-bordered text-center align-middle">
        <thead class="table-light">
          <tr>
            <th>상품명</th>
            <th>수량</th>
            <th>가격</th>
            <th>합계</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${cartList}">
            <tr>
              <td>${item.itemName}</td>
              <td>${item.quantity}</td>
              <td><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</td>
              <td><fmt:formatNumber value="${item.price * item.quantity}" pattern="#,###"/>원</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </section>

    <!-- 총 결제 금액 -->
    <section class="text-end mb-4">
      <h4>총 결제 금액: <strong><fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원</strong></h4>
    </section>

    <div class="text-center">
      <button type="submit" class="btn btn-primary px-4 py-2">💳 주문하기</button>
    </div>
  </form>
</div>
</body>
</html>
