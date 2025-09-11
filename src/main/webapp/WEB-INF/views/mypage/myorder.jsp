<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지 - 구매내역</title>
</head>
<body>
	<div>
		<div style="float: left; width: 20%;">
			<!-- 사이드바 -->
			<div>
				<h3>마이페이지</h3>
				<nav>
					<p>
						<a href="<c:url value='/mypage/myorder'/>">구매내역</a>
					</p>
					<p>
						<a href="<c:url value='/mypage/mysale'/>">판매내역</a>
					</p>
					<p>
						<a href="<c:url value='/mypage/mypage'/>">개인정보 수정</a>
					</p>
					<p>
						<a href="<c:url value='/mypage/myarticle'/>">내 게시글 보기</a>
					</p>
					<p>
						<a href="#">회원탈퇴</a>
					</p>
				</nav>
			</div>
		</div>

		<div style="float: left; width: 75%; margin-left: 20px;">
			<!-- 메인 컨텐츠 -->
			<h2>구매내역 id=1번기준</h2>

			<div>
				<table border="1">
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>가격</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty orderHistory}">
							<tr>
								<td colspan="5">주문 내역이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach var="order" items="${orderHistory}">
							<c:forEach var="item" items="${order.orderItems}"
								varStatus="loop">
								<tr>
									<c:if test="${loop.first}">
										<td rowspan="${order.orderItems.size()}"><fmt:formatDate
												value="${order.orderDate}" pattern="yyyy-MM-dd" /></td>
									</c:if>

									<td><a href="<c:url value='/items/${item.itemId}'/>">
											<img src="<c:url value='${item.thumbnailUrl}'/>"
											alt="${item.itemName}"
											style="width: 80px; height: 80px; vertical-align: middle;">
											<span>${item.itemName}</span>
									</a></td>
									<td>${item.quantity}개</td>
									<td><fmt:formatNumber value="${item.totalPrice}"
											pattern="#,##0" />원</td>

									<td>${item.orderStatus}</td>
								</tr>
							</c:forEach>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div style="margin-top: 20px;">
				<form action="<c:url value='/mypage/add-dummy-order'/>"
					method="post">
					<button type="submit">임의 구매내역 추가</button>
				</form>
			</div>

			<!-- 페이지네이션 -->
			<nav>
				<ul style="list-style: none; display: flex;">
					<li style="margin-right: 10px;"><a href="#">&laquo;</a></li>
					<li style="margin-right: 10px;"><a href="#">1</a></li>
					<li style="margin-right: 10px;"><a href="#">2</a></li>
					<li style="margin-right: 10px;"><a href="#">3</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>