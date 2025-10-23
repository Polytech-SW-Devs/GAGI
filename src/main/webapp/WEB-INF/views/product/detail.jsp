<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - ${item.title}</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: #f8f9fa;
	min-height: 100vh;
}

/* ===== MAIN ===== */
main {
	max-width: 1200px;
	margin: 0 auto;
	padding: 30px 20px 80px;
}

/* 상품 상세 컨테이너 */
.product-detail-container {
	background: white;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
	margin-bottom: 30px;
}

.product-main {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 40px;
	padding: 40px;
}

/* 이미지 영역 */
.image-section {
	position: relative;
}

.image-gallery {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.main-image {
	width: 100%;
	height: 500px;
	border-radius: 12px;
	overflow: hidden;
	background: #f5f5f5;
	display: flex;
	align-items: center;
	justify-content: center;
}

.main-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.image-placeholder {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 15px;
	color: #999;
}

.image-placeholder i {
	font-size: 80px;
}

.thumbnail-list {
	display: flex;
	gap: 10px;
	overflow-x: auto;
}

.thumbnail-item {
	min-width: 80px;
	height: 80px;
	border-radius: 8px;
	overflow: hidden;
	cursor: pointer;
	border: 2px solid transparent;
	transition: all 0.3s ease;
}

.thumbnail-item:hover {
	border-color: #501845;
}

.thumbnail-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* 상품 정보 영역 */
.info-section {
	display: flex;
	flex-direction: column;
	gap: 25px;
}

.product-header {
	border-bottom: 1px solid #eee;
	padding-bottom: 20px;
}

.product-title {
	font-size: 28px;
	font-weight: 600;
	color: #333;
	margin-bottom: 10px;
	line-height: 1.4;
}

.product-meta {
	display: flex;
	gap: 15px;
	color: #999;
	font-size: 14px;
	align-items: center;
}

.product-meta span {
	display: flex;
	align-items: center;
	gap: 5px;
}

/* 판매자 정보 */
.seller-info {
	background: #f9f9f9;
	padding: 20px;
	border-radius: 12px;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.seller-info-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 15px;
}

.seller-info-row label {
	font-weight: 500;
	color: #666;
}

.seller-info-row span {
	color: #333;
	font-weight: 500;
}

/* 상품 설명 */
.product-description {
	padding: 20px 0;
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
}

.product-description h5 {
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 15px;
	color: #333;
}

.product-description p {
	color: #666;
	line-height: 1.8;
	white-space: pre-wrap;
}

/* 가격 정보 */
.price-section {
	background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
	padding: 25px;
	border-radius: 12px;
	border: 2px solid #eee;
}

.price-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.price-label {
	font-size: 16px;
	color: #666;
	font-weight: 500;
}

.price-value {
	font-size: 32px;
	font-weight: 700;
	color: #501845;
}

.stock-info {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 14px;
	color: #999;
}

/* 수량 선택 */
.quantity-section {
	display: flex;
	align-items: center;
	gap: 15px;
	padding: 20px 0;
}

.quantity-section label {
	font-size: 16px;
	font-weight: 500;
	color: #333;
	min-width: 100px;
}

.quantity-input {
	flex: 1;
	padding: 12px 15px;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-size: 16px;
	text-align: center;
	transition: all 0.3s ease;
}

.quantity-input:focus {
	outline: none;
	border-color: #501845;
}

/* 총 금액 */
.total-price-section {
	background: #501845;
	color: white;
	padding: 20px;
	border-radius: 12px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.total-price-section span:first-child {
	font-size: 16px;
	font-weight: 500;
}

.total-price-section span:last-child {
	font-size: 28px;
	font-weight: 700;
}

/* 구매 버튼 */
.action-buttons {
	display: grid;
	grid-template-columns: 1fr 2fr;
	gap: 10px;
	margin-top: 10px;
}

.btn {
	padding: 16px 20px;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
}

.btn-cart {
	background: white;
	border: 2px solid #501845;
	color: #501845;
}

.btn-cart:hover {
	background: #f9f9f9;
	transform: translateY(-2px);
}

.btn-buy {
	background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
	color: white;
	box-shadow: 0 4px 12px rgba(80, 24, 69, 0.3);
}

.btn-buy:hover {
	background: linear-gradient(135deg, #6a1f5a 0%, #501845 100%);
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(80, 24, 69, 0.4);
}

/* 문의 섹션 */
.inquiry-section {
	background: white;
	border-radius: 15px;
	padding: 40px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

.inquiry-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #eee;
}

.inquiry-header h5 {
	font-size: 22px;
	font-weight: 600;
	color: #333;
}

.image-upload-btn {
	padding: 10px 20px;
	background: #f5f5f5;
	border: 2px solid #ddd;
	border-radius: 8px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	transition: all 0.3s ease;
}

.image-upload-btn:hover {
	background: #501845;
	color: white;
	border-color: #501845;
}

/* 댓글 목록 */
.comment-list {
	display: flex;
	flex-direction: column;
	gap: 20px;
	margin-bottom: 30px;
}

.comment-item {
	display: flex;
	gap: 15px;
	padding: 20px;
	background: #f9f9f9;
	border-radius: 12px;
	transition: all 0.3s ease;
}

.comment-item:hover {
	background: #f5f5f5;
}

.comment-avatar {
	width: 40px;
	height: 40px;
	background: #501845;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 20px;
	flex-shrink: 0;
}

.comment-content {
	flex: 1;
}

.comment-header {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 8px;
}

.comment-author {
	font-weight: 600;
	color: #333;
}

.comment-date {
	color: #999;
	font-size: 13px;
}

.comment-text {
	color: #666;
	line-height: 1.6;
}

/* 답글 */
.comment-reply {
	margin-top: 15px;
	margin-left: 30px;
	padding-left: 15px;
	border-left: 3px solid #501845;
}

/* 댓글 작성 폼 */
.comment-form {
	background: #f9f9f9;
	padding: 25px;
	border-radius: 12px;
}

.comment-textarea {
	width: 100%;
	padding: 15px;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	resize: vertical;
	transition: all 0.3s ease;
	margin-bottom: 15px;
}

.comment-textarea:focus {
	outline: none;
	border-color: #501845;
}

.comment-submit {
	display: flex;
	justify-content: flex-end;
}

.btn-submit {
	padding: 12px 30px;
	background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
}

.btn-submit:hover {
	background: linear-gradient(135deg, #6a1f5a 0%, #501845 100%);
	transform: translateY(-2px);
}

/* 반응형 */
@media (max-width: 968px) {
	.product-main {
		grid-template-columns: 1fr;
		padding: 30px 20px;
	}
	
	.main-image {
		height: 400px;
	}
}

@media (max-width: 768px) {
	main {
		padding: 20px 15px 50px;
	}
	
	.product-main {
		padding: 20px 15px;
		gap: 25px;
	}
	
	.main-image {
		height: 300px;
	}
	
	.product-title {
		font-size: 22px;
	}
	
	.price-value {
		font-size: 26px;
	}
	
	.action-buttons {
		grid-template-columns: 1fr;
	}
	
	.inquiry-section {
		padding: 25px 20px;
	}
}
</style>

<script>
	const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/mycart.js"></script>
</head>
<body>

<jsp:include page="../templete/header.jsp"></jsp:include>

<main>
	<!-- 상품 상세 정보 -->
	<div class="product-detail-container">
		<form action="${pageContext.request.contextPath}/order/buynow/${item.id}" method="get">
			<div class="product-main">
				<!-- 이미지 영역 -->
				<div class="image-section">
					<div class="image-gallery">
						<div class="main-image" id="mainImage">
							<c:choose>
								<c:when test="${not empty item.itemImages}">
									<img src="${pageContext.request.contextPath}/upload/${item.itemImages[0].fileName}" alt="${item.title}">
								</c:when>
								<c:otherwise>
									<div class="image-placeholder" id="imagePlaceholder">
										<i>📦</i>
										<p>이미지 준비중</p>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						
						<!-- 썸네일 리스트 -->
						<c:if test="${fn:length(item.itemImages) > 1}">
							<div class="thumbnail-list">
								<c:forEach var="image" items="${item.itemImages}">
									<div class="thumbnail-item">
										<img src="${pageContext.request.contextPath}/upload/${image.fileName}" alt="상품 이미지">
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
				</div>
				
				<!-- 상품 정보 영역 -->
				<div class="info-section">
					<!-- 상품 헤더 -->
					<div class="product-header">
						<h1 class="product-title">${item.title}</h1>
						<div class="product-meta">
							<span>📅 ${item.createdAt}"</span>
							<span>👁 조회 ${item.views}</span>
						</div>
					</div>
					
					<!-- 판매자 정보 -->
					<div class="seller-info">
						<div class="seller-info-row">
							<label>판매자</label>
							<span>${member.nickname}</span>
						</div>
						<div class="seller-info-row">
							<label>계좌번호</label>
							<span>${item.bankAccountNumber}</span>
						</div>
					</div>
					
					<!-- 상품 설명 -->
					<div class="product-description">
						<h5>상품 설명</h5>
						<p>${item.description}</p>
					</div>
					
					<!-- 가격 정보 -->
					<div class="price-section">
						<div class="price-row">
							<span class="price-label">판매가</span>
							<span class="price-value"><fmt:formatNumber value="${item.price}" pattern="#,##0" />원</span>
						</div>
						<div class="stock-info">
							<span>남은 수량: ${item.amount}개</span>
						</div>
					</div>
					
					<!-- 수량 선택 -->
					<div class="quantity-section">
						<label for="quantity">수량 선택</label>
						<input type="number" id="quantity" name="quantity" class="quantity-input" value="1" min="1" max="${item.amount}">
					</div>
					
					<!-- 총 상품 금액 -->
					<div class="total-price-section">
						<span>총 상품 금액</span>
						<span id="totalPrice"><fmt:formatNumber value="${item.price}" pattern="#,##0" />원</span>
					</div>
					
					<!-- 구매 버튼 -->
					<div class="action-buttons">
						<button type="button" id="addToCartBtn" class="btn btn-cart">장바구니</button>
						<button type="submit" id="buynow" class="btn btn-buy">바로구매</button>
						<%-- <a href="${pageContext.request.contextPath}/order/buynow/${item.id}?userId=${loginUser.getId()}" class="btn btn-buy">바로구매</a> --%>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<!-- 문의 섹션 -->
	<div class="inquiry-section">
		<div class="inquiry-header">
			<h5>상품 문의</h5>
			<div class="image-upload-btn" id="image_add">📷 사진올리기</div>
		</div>
		
		<!-- 댓글 목록 -->
		<div class="comment-list">
			<div class="comment-item">
				<div class="comment-avatar">👤</div>
				<div class="comment-content">
					<div class="comment-header">
						<strong class="comment-author">구매자1</strong>
						<span class="comment-date">2일 전</span>
					</div>
					<p class="comment-text">배송은 어떻게 되나요?</p>
					
					<!-- 답글 -->
					<div class="comment-reply">
						<div class="comment-item">
							<div class="comment-avatar">👨‍💼</div>
							<div class="comment-content">
								<div class="comment-header">
									<strong class="comment-author">판매자</strong>
									<span class="comment-date">1일 전</span>
								</div>
								<p class="comment-text">입금 확인 후 택배로 발송됩니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="comment-item">
				<div class="comment-avatar">👤</div>
				<div class="comment-content">
					<div class="comment-header">
						<strong class="comment-author">구매자2</strong>
						<span class="comment-date">3일 전</span>
					</div>
					<p class="comment-text">상품 상태는 어떤가요?</p>
				</div>
			</div>
		</div>
		
		<!-- 댓글 작성 폼 -->
		<div class="comment-form">
			<textarea class="comment-textarea" placeholder="궁금한 점을 문의해보세요" rows="4"></textarea>
			<div class="comment-submit">
				<button class="btn-submit">문의하기</button>
			</div>
		</div>
	</div>
</main>

<jsp:include page="../templete/footer.jsp"></jsp:include>

<input type="file" id="imageUpload" accept="image/*" style="display: none;">

<script>
// 총 가격 계산
function updateTotalPrice() {
    const quantityInput = document.getElementById('quantity');
    let quantity = parseInt(quantityInput.value, 10);
    const maxAmount = ${item.amount};
    const unitPrice = ${item.price};

    if (isNaN(quantity)) {
        quantity = 1;
    }

    quantity = Math.max(1, Math.min(quantity, maxAmount));
    
    if (parseInt(quantityInput.value, 10) !== quantity) {
        quantityInput.value = quantity;
    }

    const totalPrice = quantity * unitPrice;
    document.getElementById('totalPrice').textContent = totalPrice.toLocaleString() + '원';
}

document.getElementById('quantity').addEventListener('input', updateTotalPrice);
window.addEventListener('DOMContentLoaded', updateTotalPrice);

// 이미지 업로드
const imageAddButton = document.getElementById('image_add');
const imageUploadInput = document.getElementById('imageUpload');

imageAddButton.addEventListener('click', () => {
    imageUploadInput.click();
});

imageUploadInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
            console.log('이미지 업로드:', e.target.result);
            // 여기에 이미지 업로드 로직 추가
        };
        reader.readAsDataURL(file);
    }
});

// 장바구니 담기
const userId = parseInt('${loginUser != null ? loginUser.id : 0}', 10);
const itemId = parseInt('${item.id}', 10);

document.getElementById('addToCartBtn').addEventListener('click', () => {
    const quantity = parseInt(document.getElementById('quantity').value, 10) || 1;

    if (userId === 0) {
        alert('로그인이 필요합니다.');
        return;
    }

    const formData = new URLSearchParams();
    formData.append("userId", userId);
    formData.append("itemId", itemId);
    formData.append("quantity", quantity);

    fetch('${pageContext.request.contextPath}/mycart/add', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: formData.toString()
    })
    .then(res => res.json())
    .then(data => {
        alert(data.message);
    })
    .catch(err => {
        console.error('장바구니 Ajax 오류:', err);
        alert('장바구니 담기 실패: ' + err.message);
    });
});

// 썸네일 클릭시 메인 이미지 변경
document.querySelectorAll('.thumbnail-item').forEach(item => {
    item.addEventListener('click', function() {
        const imgSrc = this.querySelector('img').src;
        document.querySelector('.main-image img').src = imgSrc;
    });
});
</script>
</body>
</html>