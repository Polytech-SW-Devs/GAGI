<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script>
	const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/js/test/imageUpload.js"></script>
<style>
/* 이미지 목록을 2열 그리드로 설정 */
#image-list-display {
    display: grid;
    grid-template-columns: repeat(2, 1fr); /* 2개의 열을 동일한 비율로 생성 */
    gap: 10px; /* 아이템 사이의 간격 */
}

/* 각 이미지 아이템의 컨테이너 */
.image-preview-item {
    position: relative; /* 삭제 버튼을 위한 기준점 */
    aspect-ratio: 1 / 1; /* 1:1 비율의 정사각형 유지 */
    cursor: pointer; /* 클릭 가능함을 표시 */
}

/* 대표 사진으로 선택된 아이템에 적용될 스타일 */
.image-preview-item.selected-image {
    outline: 3px solid #0d6efd; /* 파란색 테두리 */
    outline-offset: 2px;
}

/* 미리보기 이미지 스타일 */
.image-preview-item img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지가 컨테이너에 꽉 차도록 설정 */
    border: 1px solid #ddd;
    border-radius: 4px;
}

/* 삭제 버튼 스타일 */
.delete-image-btn {
    position: absolute; /* 부모(.image-preview-item) 기준으로 위치 설정 */
    top: 5px;
    right: 5px;
    width: 24px;
    height: 24px;
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    border: none;
    border-radius: 50%;
    cursor: pointer;
    font-size: 12px;
    font-weight: bold;
    line-height: 24px;
    text-align: center;
    padding: 0;
    transition: background-color 0.2s;
}

.delete-image-btn:hover {
    background-color: rgba(0, 0, 0, 0.8);
}
</style>
</head>
<body>
<jsp:include page="../templete/headerLogin.jsp"></jsp:include>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-11 col-md-12">
        <form action="<c:url value='/test/testUpload'/>" method="post">
            <!-- 상품 제목 -->
            <div class="row mb-3">
                <div class="col-12">
                    <input type="text" name="title" class="form-control form-control-lg" placeholder="상품 제목을 입력하세요" required>
                </div>
            </div>

            <!-- 카테고리 -->
            <div class="row mb-3">
                <div class="col-12">
                    <select name="categoryId" class="form-select form-select-lg" required>
                        <option value="" selected disabled>카테고리를 선택하세요</option>
                        <option value="0">농산물</option>
                        <option value="1">수산물</option>
                        <option value="2">잡곡류</option>
                        <option value="3">축산물</option>
                    </select>
                </div>
            </div>
            
            <!-- 메인 상품 정보 -->
            <div class="row">
                <!-- 좌측 이미지 영역 -->
                <div class="col-md-5">
                    <!-- 대표 이미지 표시 영역 -->
                    <div id="main-preview-area" class="border rounded p-2 bg-light d-flex justify-content-center align-items-center" style="min-height: 300px; margin-bottom: 1rem;">
                        <span id="main-preview-placeholder" class="text-muted">대표 사진을 선택하세요.</span>
                        <img id="main-preview-image" src="#" style="display: none; max-width: 100%; max-height: 280px; object-fit: contain;">
                    </div>

                    <button type="button" id="add-image-btn" class="btn btn-primary my-2 w-100">사진 올리기</button>

                    <!-- 업로드된 이미지 목록이 여기에 표시됩니다. -->
                    <div id="image-list-display"></div>

                    <input type="file" id="file-input" multiple accept="image/*" style="display: none;">
                    <input type="hidden" name="imageFileNames" id="image-filenames-input">
                    <input type="hidden" name="representativeImage" id="representative-image-input"> <!-- 대표사진 파일명 전송용 -->
                </div>
                
                <!-- 우측 상품 상세 정보 -->
                <div class="col-md-7">
                    <div class="ms-3">
                        <!-- 판매자 정보 (자동 세팅) -->
                        <div class="mb-4">
                            <div class="p-3 bg-light rounded border">
                                <div class="row">
                                    <div class="col-6">
                                        <span class="fs-5 text-muted">판매자 :</span>
                                        <span class="fs-5 fw-bold ms-2">${loginUser.nickname}</span>
                                        <!-- 회원 ID를 hidden으로 전송 -->
               							<input type="hidden" name="userId" value="${loginUser.id}">
                                    </div>
                                    <div class="col-6">
                                        <label for="bankAccountNumber" class="fs-5 text-muted">계좌번호 :</label>
                                        <input type="text" name="bankAccountNumber" id="bankAccountNumber" class="form-control form-control-sm d-inline-block w-auto ms-2" placeholder="계좌번호 입력" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 상품 설명 -->
                        <div class="mb-4">
                            <h5 class="mb-3">상품 상세설명</h5>
                            <textarea name="description" class="form-control" rows="6" placeholder="상품 설명을 입력하세요" required></textarea>
                        </div>
                        
                        <!-- 배송지 -->
                        <div class="mb-4">
                            <label for="delivery" class="me-3 fs-5">DELIVERY :</label>
                            <input type="text" name="delivery" id="delivery" class="form-control form-control-lg w-75" placeholder="배송지를 입력하세요" required>
                        </div>
                        
                        <!-- 직거래 가능 여부 -->
                        <div class="mb-4">
                            <label class="me-3 fs-5 align-middle">직거래 가능 여부 :</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="isDirectDeal" id="direct-deal-y" value="Y">
                                <label class="form-check-label" for="direct-deal-y">가능</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="isDirectDeal" id="direct-deal-n" value="N" checked>
                                <label class="form-check-label" for="direct-deal-n">불가능</label>
                            </div>
                        </div>
                        
                        <!-- 가격 정보 -->
                        <div class="mb-4">
                            <div class="d-flex align-items-center mb-2">
                                <label for="price" class="me-3 fs-5">판매가 :</label>
                                <input type="number" name="price" id="price" class="form-control form-control-lg w-50" placeholder="가격 입력" required>
                            </div>
                            <div class="d-flex align-items-center">
                                <label for="amount" class="me-3 fs-6">재고 수량 :</label>
                                <input type="number" name="amount" id="amount" class="form-control form-control-sm w-25" value="1" min="1" required>
                            </div>
                        </div>
                        
                        <!-- 등록 버튼 -->
                        <div class="row g-2">
                            <div class="col-6">
                                <button type="reset" class="btn btn-outline-secondary btn-lg w-100">다시쓰기</button>
                            </div>
                            <div class="col-6">
                                <button type="submit" class="btn btn-dark btn-lg fw-bold w-100">상품 등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        </div>
    </div>
</div>

<jsp:include page="../templete/footer.jsp"></jsp:include>


<script>
</script>
</body>
</html>
