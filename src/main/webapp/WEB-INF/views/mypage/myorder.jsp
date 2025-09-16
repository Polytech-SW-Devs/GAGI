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
			<h2>구매내역</h2>

			<div>
				<table border="1">
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>총 가격</th>
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
										<!-- LocalDateTime을 DTO에서 문자열로 변환 -->
										<td rowspan="${order.orderItems.size()}">${order.orderDateStr}</td>
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
					<!-- 페이지네이션 -->
					<tfoot>
						<tr>
							<td colspan="5">
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
