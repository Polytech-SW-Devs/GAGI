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
<jsp:include page="../templete/logo.jsp"></jsp:include>
</head>
<body>
	<div>
		<div style="float: left; width: 20%;">
			<!-- 사이드바 -->
			<div>
				<h3><a href="<c:url value='/mypage'/>">마이페이지</a></h3>
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
			<h2>구매내역</h2>

			<div>
				<table border="1">
					<thead>
						<tr>
							<th>주문정보</th>
							<th>상품정보</th>
							<th>주문상태</th>
							<th>배송지</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="4">주문 내역이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach var="order" items="${list}">
							<tr>
								<td>
									<p>주문일: ${order.createdAtDate}</p>
									<p>거래유형: ${order.transactionType}</p>
								</td>
								<td>
                                    <a href="<c:url value='/items/${order.itemId}'/>">
                                        <img src="<c:url value='${order.imageUrl}'/>"
                                        alt="${order.title}"
                                        style="width: 80px; height: 80px; vertical-align: middle;">
                                        <span>${order.title}</span>
                                    </a>
                                    <p>단가: <fmt:formatNumber value="${order.price}" pattern="#,##0" />원</p>
                                    <p>수량: ${order.amount}개</p>
                                    <p>총 금액: <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" />원</p>
								</td>
								<td>${order.orderStatus}</td>
								<td>
									<p>${order.deliveryAddressMain}</p>
									<p>${order.deliveryAddressDetail}</p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!-- 페이지네이션 -->
					<tfoot>
						<tr>
							<td colspan="4">
								<div class="pagination pagination-sm justify-content-center">
									<div class="page-item">
										<a href="?page=1${pager.query}" class="page-link">처음</a>
									</div>
									<div class="page-item">
										<a href="?page=${pager.prev}${pager.query}" class="page-link">이전</a>
									</div>

									<c:forEach var="page" items="${pager.list}">
										<div class="page-item ${pager.page == page ? 'active' : ''}">
											<a href="?page=${page}${pager.query}" class="page-link">${page}</a>
										</div>
									</c:forEach>

									<div class="page-item">
										<a href="?page=${pager.next}${pager.query}" class="page-link">다음</a>
									</div>
									<div class="page-item">
										<a href="?page=${pager.last}${pager.query}" class="page-link">마지막</a>
									</div>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>


		</div>
	</div>
</body>
</html>
