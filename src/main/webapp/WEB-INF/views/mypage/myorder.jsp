<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div>
		<div><h3>구매 내역</h3></div>
	</div>
	
	
	<div>
		<table border="1" class="table table-sm">
			<thead class="table-dark">
				<tr>
					<th>상품 사진</th>
					<th>상품명</th>
					<th>구매 수량</th>
					<th>총 가격</th>
					<th>주문 일자</th>
					<th>배송 여부</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${orderlist.size() < 1}">
				<tr>
					<td colspan="6">주문 내역이 없습니다</td>
				</tr>
				</c:if>
				
				<c:forEach var="item" items="${orderlist}">
				<tr>
					<td><img src="${item.imageUrl}" alt="상품 이미지" style="width:100px; height:100px;"></td>
					<td>${item.itemTitle}</td>
					<td>${item.quantity}</td>
					<td>${item.totalPrice}</td>
					<td>${item.orderDate}</td>
					<td>${item.orderStatus}</td>
				</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>
</div>
</body>
</html>