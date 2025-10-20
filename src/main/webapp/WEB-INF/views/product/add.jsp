<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 상품 등록</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/product/itemImages.js"></script>
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
	max-width: 900px;
	margin: 0 auto;
	padding: 50px 20px 80px;
}

/* 페이지 헤더 */
.page-header {
	text-align: center;
	margin-bottom: 40px;
}

.page-header h3 {
	font-size: 32px;
	font-weight: 600;
	color: #333;
	margin-bottom: 10px;
}

.page-header p {
	color: #666;
	font-size: 15px;
}

/* 폼 컨테이너 */
.form-container {
	background: white;
	border-radius: 15px;
	padding: 40px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
}

/* 섹션 타이틀 */
.section-title {
	font-size: 18px;
	font-weight: 600;
	color: #333;
	margin-bottom: 15px;
	display: flex;
	align-items: center;
	gap: 8px;
}

.section-title::before {
	content: '';
	width: 4px;
	height: 20px;
	background: #501845;
	border-radius: 2px;
}

/* 이미지 업로드 섹션 */
.image-upload-section {
	margin-bottom: 40px;
	padding-bottom: 30px;
	border-bottom: 2px solid #f0f0f0;
}

#files {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
	gap: 15px;
	margin-bottom: 20px;
	list-style: none;
	padding: 0;
}

#files > li {
	position: relative;
	aspect-ratio: 1;
	border-radius: 12px;
	overflow: hidden;
	border: 2px solid #eee;
	background: #f9f9f9;
	transition: all 0.3s ease;
}

#files > li:hover {
	border-color: #501845;
	transform: translateY(-2px);
}

#files > li img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#files > li input[type="file"] {
	display: none;
}

.image-controls {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
	padding: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.main-image-label {
	display: flex;
	align-items: center;
	gap: 5px;
	color: white;
	font-size: 12px;
	cursor: pointer;
}

.main-image-label input[type="radio"] {
	cursor: pointer;
	width: 16px;
	height: 16px;
	accent-color: #501845;
}

.delete-image-btn {
	background: #ff4444;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 12px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.delete-image-btn:hover {
	background: #cc0000;
}

.add-image-btn {
	padding: 15px 30px;
	background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 2px 8px rgba(80, 24, 69, 0.3);
	display: inline-flex;
	align-items: center;
	gap: 8px;
}

.add-image-btn:hover {
	background: linear-gradient(135deg, #6a1f5a 0%, #501845 100%);
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(80, 24, 69, 0.4);
}

.add-image-btn::before {
	content: '📷';
	font-size: 18px;
}

/* 폼 그룹 */
.form-group {
	margin-bottom: 30px;
}

.form-group label {
	display: block;
	font-size: 15px;
	font-weight: 500;
	color: #333;
	margin-bottom: 10px;
}

.form-group label span.required {
	color: #ff4444;
	margin-left: 3px;
}

.form-control {
	width: 100%;
	padding: 14px 18px;
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all 0.3s ease;
	background: #fafafa;
}

.form-control:focus {
	outline: none;
	border-color: #501845;
	background: white;
	box-shadow: 0 0 0 3px rgba(80, 24, 69, 0.1);
}

.form-select {
	width: 100%;
	padding: 14px 18px;
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all 0.3s ease;
	background: #fafafa;
	cursor: pointer;
}

.form-select:focus {
	outline: none;
	border-color: #501845;
	background: white;
	box-shadow: 0 0 0 3px rgba(80, 24, 69, 0.1);
}

textarea.form-control {
	resize: vertical;
	min-height: 150px;
	line-height: 1.6;
}

input[type="number"].form-control {
	-moz-appearance: textfield;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

/* 라디오 버튼 그룹 */
.radio-group {
	display: flex;
	gap: 20px;
	margin-top: 10px;
}

.radio-label {
	display: flex;
	align-items: center;
	gap: 8px;
	padding: 12px 20px;
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	cursor: pointer;
	transition: all 0.3s ease;
	background: #fafafa;
	font-size: 15px;
}

.radio-label:hover {
	border-color: #501845;
	background: white;
}

.radio-label input[type="radio"] {
	cursor: pointer;
	width: 18px;
	height: 18px;
	accent-color: #501845;
}

.radio-label input[type="radio"]:checked + span {
	color: #501845;
	font-weight: 600;
}

/* 그리드 레이아웃 (가격/수량) */
.form-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

/* 버튼 그룹 */
.button-group {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 15px;
	margin-top: 40px;
	padding-top: 30px;
	border-top: 2px solid #f0f0f0;
}

.btn {
	padding: 16px 20px;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	text-decoration: none;
	display: inline-block;
	text-align: center;
}

.btn-primary {
	background: linear-gradient(135deg, #501845 0%, #6a1f5a 100%);
	color: white;
	box-shadow: 0 4px 12px rgba(80, 24, 69, 0.3);
}

.btn-primary:hover {
	background: linear-gradient(135deg, #6a1f5a 0%, #501845 100%);
	transform: translateY(-2px);
	box-shadow: 0 6px 16px rgba(80, 24, 69, 0.4);
}

.btn-secondary {
	background: white;
	border: 2px solid #ddd;
	color: #666;
}

.btn-secondary:hover {
	background: #f5f5f5;
	border-color: #999;
	color: #333;
	transform: translateY(-2px);
}

/* 도움말 텍스트 */
.help-text {
	font-size: 13px;
	color: #999;
	margin-top: 8px;
	display: flex;
	align-items: center;
	gap: 5px;
}

.help-text::before {
	content: 'ℹ️';
	font-size: 14px;
}

/* 반응형 */
@media (max-width: 768px) {
	main {
		padding: 30px 15px 50px;
	}
	
	.form-container {
		padding: 25px 20px;
	}
	
	.page-header h3 {
		font-size: 24px;
	}
	
	#files {
		grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
		gap: 10px;
	}
	
	.form-row {
		grid-template-columns: 1fr;
	}
	
	.button-group {
		grid-template-columns: 1fr;
	}
	
	.radio-group {
		flex-direction: column;
		gap: 10px;
	}
}
</style>
</head>
<body>
<jsp:include page="../templete/header.jsp"></jsp:include>

<main>
	<div class="page-header">
		<h3>상품 등록</h3>
		<p>판매하실 상품의 정보를 입력해주세요</p>
	</div>
	
	<div class="form-container">
		<form method="post" enctype="multipart/form-data">
			<!-- 카테고리 선택 -->
			<div class="form-group">
				<label for="selectBox">카테고리 <span class="required">*</span></label>
				<select id="selectBox" name="category.categoryId" class="form-select" required>
					<option value="" disabled 
						<c:if test="${item.category == null || item.category.categoryId == null}">selected</c:if>>
						카테고리를 선택하세요
					</option>
					<c:forEach var="c" items="${categories}">
						<option value="${c.categoryId}" 
							<c:if test="${item.category != null && c.categoryId == item.category.categoryId}">selected</c:if>>
							${c.name}
						</option>
					</c:forEach>
				</select>
			</div>
			
			<!-- 이미지 업로드 섹션 -->
			<div class="image-upload-section">
				<div class="section-title">상품 이미지</div>
				<p class="help-text">첫 번째 이미지가 대표 이미지로 설정됩니다</p>
				
				<!-- ⚠️ 주의: 등록 페이지는 빈 ul로 시작 (JS가 자동으로 첫 이미지 추가) -->
				<ul id="files"></ul>
				
				<button type="button" id="image_add" class="add-image-btn">이미지 추가</button>
			</div>
			
			<!-- 상품명 -->
			<div class="form-group">
				<label for="title">상품명 <span class="required">*</span></label>
				<input type="text" id="title" name="title" class="form-control" placeholder="상품명을 입력해주세요" required>
			</div>
			
			<!-- 상품 설명 -->
			<div class="form-group">
				<label for="description">상품 설명 <span class="required">*</span></label>
				<textarea id="description" name="description" class="form-control" rows="6" placeholder="상품에 대해 자세히 설명해주세요" required></textarea>
				<p class="help-text">구매자가 상품을 잘 이해할 수 있도록 상세하게 작성해주세요</p>
			</div>
			
			<!-- 원산지 -->
			<div class="form-group">
				<label for="delivery">원산지 <span class="required">*</span></label>
				<input type="text" id="delivery" name="delivery" class="form-control" placeholder="예: 서울특별시 강남구" required>
			</div>
			
			<!-- 직거래 여부 -->
			<div class="form-group">
				<label>직거래 여부 <span class="required">*</span></label>
				<div class="radio-group">
					<label class="radio-label">
						<input type="radio" name="isDirectDeal" value="N" checked>
						<span>직거래 불가</span>
					</label>
					<label class="radio-label">
						<input type="radio" name="isDirectDeal" value="Y">
						<span>직거래 가능</span>
					</label>
				</div>
			</div>
			
			<!-- 판매자 계좌번호 -->
			<div class="form-group">
				<label for="bankAccountNumber">판매자 계좌번호 <span class="required">*</span></label>
				<input type="text" id="bankAccountNumber" name="bankAccountNumber" class="form-control" placeholder="예: 국민 123-456-789012" required>
				<p class="help-text">구매자가 입금할 계좌번호를 입력해주세요</p>
			</div>
			
			<!-- 판매 가격 & 수량 -->
			<div class="form-row">
				<div class="form-group">
					<label for="price">판매 가격 (원) <span class="required">*</span></label>
					<input type="number" id="price" name="price" class="form-control" placeholder="0" min="0" required>
				</div>
				
				<div class="form-group">
					<label for="amount">판매 수량 (개) <span class="required">*</span></label>
					<input type="number" id="amount" name="amount" class="form-control" placeholder="0" min="1" required>
				</div>
			</div>
			
			<!-- 버튼 그룹 -->
			<div class="button-group">
				<a href="../product/list" class="btn btn-secondary">취소</a>
				<button type="submit" class="btn btn-primary">등록하기</button>
			</div>
		</form>
	</div>
</main>

<jsp:include page="../templete/footer.jsp"></jsp:include>

</body>
</html>