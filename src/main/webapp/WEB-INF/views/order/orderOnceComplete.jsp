<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>주문 완료</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../templete/header.jsp" %>

<div class="container mt-5 mb-5">
  <h2 class="mb-4">✅ 주문 완료</h2>

  <section class="mb-4">
    <h4>주문 정보</h4>
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>상품명</th>
          <th>가격</th>
          <th>수량</th>
          <th>총금액</th>
        </tr>
      </thead>
      <tbody>
          <tr>
            <td>${title}</td>
            <td><fmt:formatNumber value="${order.price}" pattern="#,###"/>원</td>
            <td>${order.amount}</td>
            <td><fmt:formatNumber value="${order.price * order.amount}" pattern="#,###"/>원</td>
          </tr>
      </tbody>
    </table>
  </section>

  <div class="text-end mt-4">
    <h4>총 결제 금액: 
      <strong>
        <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원
      </strong>
    </h4>
  </div>

  <div class="text-center mt-4">
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary px-4 py-2">🏠 메인으로 돌아가기</a>
  </div>
</div>

<%@ include file="../templete/footer.jsp" %>
</body>
</html>

