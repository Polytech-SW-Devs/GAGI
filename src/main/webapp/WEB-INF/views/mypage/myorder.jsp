<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>마이페이지 - 구매내역</title>
<jsp:include page="../templete/logo.jsp"></jsp:include>
<script>
	const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/mypage/myorder.js"></script>
</head>
<body class="bg-light">
	<!-- 헤더 영역 -->
	<header class="bg-white border-bottom py-3 mb-4">
		<div class="container-fluid">
			<div class="d-flex justify-content-between align-items-center">
				<!-- 로고 -->
				<div class="d-flex align-items-center">
					<i class="bi bi-egg-fried text-warning me-2"
						style="font-size: 2rem;"></i>
					<h1 class="h3 mb-0 text-dark fw-bold">가지 마켓</h1>
				</div>
				<!-- 우측 버튼들 -->
				<div class="d-flex gap-2">
					<button class="btn btn-success btn-sm px-3">로그아웃</button>
					<button class="btn btn-outline-secondary btn-sm px-3">장바구니</button>
				</div>
			</div>
		</div>
	</header>

	<!-- 메인 컨텐츠 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 왼쪽 공백 영역 -->
			<div class="col-2"></div>

			<!-- 사이드바 -->
			<div class="col-2 pe-0">
				<div class="bg-white rounded border p-3">
					<h5 class="text-center mb-4 fw-bold">마이페이지</h5>
					<nav class="nav flex-column gap-2">
						<a href="<c:url value='/mypage/myorder'/>" class="nav-link text-dark py-2 px-3 text-center border rounded bg-light fw-bold">구매내역</a>
						<a href="<c:url value='/mypage/mysale'/>" class="nav-link text-dark py-2 px-3 text-center border rounded">판매내역</a>
						<a href="<c:url value='/mypage/delevery/addressList'/>" class="nav-link text-dark py-2 px-3 text-center border rounded">배달자 관리</a>
						<a href="<c:url value='/product/list'/>" class="nav-link text-dark py-2 px-3 text-center border rounded">내 게시글 보기</a>
						<a href="#" class="nav-link text-dark py-2 px-3 text-center border rounded">회원탈퇴</a>
					</nav>
				</div>
			</div>

			<!-- 메인 컨테이너 -->
			<div class="col-6 px-3">
				<div class="bg-white rounded border p-4">
					<h4 class="mb-4 text-start fw-bold">구매 내역</h4>

					<!-- 주문 상태 필터 버튼 -->
					<div class="d-flex justify-content-start gap-2 mb-3">
						<a href="<c:url value='/mypage/myorder'/>"
							class="btn btn-sm ${empty param.orderStatus ? 'btn-primary' : 'btn-outline-primary'}">전체</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=입금준비'/>"
							class="btn btn-sm ${param.orderStatus == '입금준비' ? 'btn-primary' : 'btn-outline-primary'}">입금준비</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=입금완료'/>"
							class="btn btn-sm ${param.orderStatus == '입금완료' ? 'btn-primary' : 'btn-outline-primary'}">입금완료</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=배송중'/>"
							class="btn btn-sm ${param.orderStatus == '배송중' ? 'btn-primary' : 'btn-outline-primary'}">배송중</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=배송완료'/>"
							class="btn btn-sm ${param.orderStatus == '배송완료' ? 'btn-primary' : 'btn-outline-primary'}">배송완료</a>
						<a href="<c:url value='/mypage/myorder?orderStatus=취소'/>"
							class="btn btn-sm ${param.orderStatus == '취소' ? 'btn-primary' : 'btn-outline-primary'}">취소</a>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered align-middle">
							<thead class="table-light">
								<tr class="text-center">
									<th style="width: 15%;">주문일자</th>
									<th style="width: 45%;">상품정보</th>
									<th style="width: 15%;">주문금액</th>
									<th style="width: 15%;">주문상태</th>
									<th style="width: 10%;">리뷰작성</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
									<tr>
										<td colspan="5" class="text-center py-5 text-muted">
											<div>
												<i class="bi bi-inbox text-muted mb-2"
													style="font-size: 2rem;"></i>
												<div>구매 내역이 없습니다</div>
											</div>
										</td>
									</tr>
								</c:if>

								<c:forEach var="order" items="${list}">
									<tr>
										<td class="text-center small"><fmt:formatDate
												value="${order.createdAtDate}" pattern="yyyy-MM-dd" /></td>
										<td>
											<div class="d-flex align-items-center">
												<img src="<c:url value='${order.imageUrl}'/>"
													alt="${order.title}" class="rounded"
													style="width: 60px; height: 60px; object-fit: cover;">
												<div class="ms-3">
													<a href="<c:url value='/items/${order.itemId}'/>"
														class="text-decoration-none text-dark fw-bold">${order.title}</a>
													<div class="text-muted small">${order.amount}개</div>
												</div>
											</div>
										</td>
										<td class="text-center fw-bold"><fmt:formatNumber
												value="${order.totalPrice}" pattern="#,##0" />원</td>
										<td class="text-center">
											<div>
												<span class="badge bg-primary">${order.orderStatus}</span>
											</div> <c:if
												test="${order.orderStatus == '입금준비' || order.orderStatus == '입금완료'}">
												<button
													class="btn btn-outline-secondary btn-sm py-0 px-1 cancel-order-btn"
													data-order-id="${order.id}">주문취소</button>

											</c:if>
										</td>
										<td class="text-center">
											<button class="btn btn-outline-primary btn-sm">리뷰작성</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- 페이지네이션 -->
					<div class="d-flex justify-content-center mt-4">
						<nav aria-label="페이지 네비게이션">
							<ul class="pagination pagination-sm">
								<li class="page-item"><a href="?page=1${pager.query}"
									class="page-link">처음</a></li>
								<li class="page-item"><a
									href="?page=${pager.prev}${pager.query}" class="page-link">이전</a>
								</li>

								<c:forEach var="page" items="${pager.list}">
									<li class="page-item ${pager.page == page ? 'active' : ''}">
										<a href="?page=${page}${pager.query}" class="page-link">${page}</a>
									</li>
								</c:forEach>

								<li class="page-item"><a
									href="?page=${pager.next}${pager.query}" class="page-link">다음</a>
								</li>
								<li class="page-item"><a
									href="?page=${pager.last}${pager.query}" class="page-link">마지막</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>

			<!-- 오른쪽 공백 영역 -->
			<div class="col-2"></div>
		</div>
	</div>
</body>
</html>