<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 배송지 관리</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: white;
	min-height: 100vh;
}

/* ===== MAIN ===== */
main {
	max-width: 1920px;
	margin: 0 auto;
	padding: 50px 360px 80px;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	display: flex;
	gap: 30px;
}



.main-content {
	flex: 1;
}

.address-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 40px;
	transition: all 0.3s ease;
}

.address-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.section-header {
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.section-header h3 {
	font-size: 26px;
	font-weight: 500;
	color: #333;
}

.address-list {
	display: flex;
	flex-direction: column;
	gap: 15px;
	margin-bottom: 30px;
}

.address-item {
	background: #f9f9f9;
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	padding: 25px;
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	transition: all 0.3s ease;
}

.address-item:hover {
	border-color: #501845;
	box-shadow: 0 2px 10px rgba(80, 24, 69, 0.1);
}

.address-info h4 {
	font-size: 18px;
	font-weight: 500;
	color: #333;
	margin-bottom: 10px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.badge-default {
	background: #501845;
	color: white;
	padding: 4px 12px;
	border-radius: 12px;
	font-size: 12px;
	font-weight: 500;
}

.address-info .phone {
	font-size: 14px;
	color: #666;
	margin-bottom: 8px;
}

.address-info .address {
	font-size: 15px;
	color: #333;
	line-height: 1.5;
}

.address-actions {
	display: flex;
	gap: 8px;
	align-items: flex-start;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
	text-decoration: none;
	display: inline-block;
}

.btn-edit {
	background: white;
	color: #501845;
	border: 2px solid #501845;
}

.btn-edit:hover {
	background: #501845;
	color: white;
	transform: translateY(-2px);
}

.btn-delete {
	background: white;
	color: #dc3545;
	border: 2px solid #dc3545;
}

.btn-delete:hover {
	background: #dc3545;
	color: white;
	transform: translateY(-2px);
}

.empty-state {
	text-align: center;
	padding: 80px 20px;
	color: #8E8E8E;
}

.empty-state p {
	font-size: 18px;
	margin-bottom: 30px;
}

.info-text {
	text-align: center;
	color: #666;
	font-size: 14px;
	margin-bottom: 25px;
}

.btn-add-container {
	text-align: center;
}

.btn-add {
	padding: 16px 50px;
	background: #501845;
	color: white;
	font-size: 18px;
	font-weight: 500;
}

.btn-add:hover {
	background: #3d1234;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(80, 24, 69, 0.3);
}

@media (max-width: 1600px) {
	main {
		padding: 50px 100px 80px;
	}
}

@media (max-width: 1400px) {
	main {
		padding: 50px 50px 80px;
	}
	
	.container {
		flex-direction: column;
	}
	
	.sidebar {
		width: 100%;
		margin-bottom: 30px;
	}
}

@media (max-width: 768px) {
	main {
		padding: 30px 20px 50px;
	}
	
	.address-section {
		padding: 30px 20px;
	}
	
	.address-item {
		flex-direction: column;
		gap: 15px;
	}
	
	.address-actions {
		width: 100%;
		justify-content: flex-end;
	}
}
</style>
</head>
<body>
	<%@ include file="../../templete/header.jsp" %>

	<main>
		<div class="container">
			<!-- 사이드바 -->
			<jsp:include page="/WEB-INF/views/templete/mypageSidebar.jsp" />

			<div class="main-content">
				<section class="address-section">
					<div class="section-header">
						<h3><c:out value="${loginUser.nickname}"/>님의 배송지</h3>
					</div>

					<c:choose>
						<c:when test="${not empty deleveryList}">
							<div class="address-list">
								<c:forEach var="addr" items="${deleveryList}">
									<c:url var="updateUrl" value="/mypage/delevery/addressUpdate/${addr.addressId}"/>
									<c:url var="deleteUrl" value="/mypage/delevery/addressDelete/${addr.addressId}"/>
									
									<div class="address-item">
										<div class="address-info">
											<h4>
												<c:out value="${addr.member}"/>
												<c:if test="${addr.isDefault eq 'Y'}">
													<span class="badge-default">기본배송지</span>
												</c:if>
											</h4>
											<div class="phone"><c:out value="${addr.phone}"/></div>
											<div class="address"><c:out value="${addr.allAddress}"/></div>
										</div>
										<div class="address-actions">
											<a href="${updateUrl}" class="btn btn-edit">수정</a>
											<form method="post" action="${deleteUrl}" style="display:inline;" 
												  onsubmit="return confirm('정말 이 주소를 삭제하시겠습니까?');">
												<button type="submit" class="btn btn-delete">삭제</button>
											</form>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="empty-state">
								<p>등록된 배송지가 없습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>

					<p class="info-text">※ 배송지는 최대 15개까지 등록하실 수 있습니다.</p>

					<div class="btn-add-container">
						<c:url var="addUrl" value="/mypage/delevery/addressAdd"/>
						<a href="${addUrl}" class="btn btn-add">배송지 등록</a>
					</div>
				</section>
			</div>
		</div>
	</main>

	<%@ include file="../../templete/footer.jsp" %>
</body>
</html>