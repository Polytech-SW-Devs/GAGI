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
		<div><h3>판매 내역</h3></div>
	</div>
	
	
	<div>
		<table border="1" class="table table-sm">
			<thead class="table-dark">
				<tr>
					<th>주문번호</th>
					<th>주문자</th>
					<th>거래유형</th>
					<th>주문상태</th>
					<th>총 주문 금액</th>
					<th>결제수단</th>
					<th>수령인 이름</th>
					<th>수령인 연락처</th>
					<th>배송지 우편번호</th>
					<th>배송지 주소(기본)</th>
					<th>배송지 주소(상세)</th>
					<th>배송 요청사항</th>
					<th>직거래 장소</th>
					<th>직거래 일시</th>
					<th>거래 연락처</th>
					<th>생성일</th>
					<th>수정일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${list.size() < 1}">
				<tr>
					<td colspan="17">주문 내역이 없습니다</td>
				</tr>
				</c:if>
				
				<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.id}</td>
					<td>${item.userId}</td>					
					<td>${item.transactionType}</td>
					<td>${item.orderStatus}</td>
					<td>${item.totalPrice}</td>
					<td>${item.paymentMethod}</td>
					<td>${item.recipientName}</td>
					<td>${item.recipientPhone}</td>
					<td>${item.deliveryZipcode}</td>
					<td>${item.deliveryAddressMain}</td>
					<td>${item.deliveryAddressDetail}</td>
					<td>${item.deliveryMemo}</td>
					<td>${item.meetingLocation}</td>
					<td>${item.meetingDateTime}</td>
					<td>${item.contactInfo}</td>
					<td>${item.createdAt}</td>
					<td>${item.updatedAt}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>