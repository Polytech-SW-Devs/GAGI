<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="../templete/headerLogin.jsp"></jsp:include>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-11 col-md-12">
    <!-- 상품 제목 및 기본 정보 -->
    <div class="row mb-3">
        <div class="col-12">
            <h4 class="fw-bold">${item.title}</h4>
        </div>
    </div>
    
    <!-- 메인 상품 정보 -->
    <div class="row">
        <!-- 좌측 이미지 영역 -->
        <div class="col-md-5">
            <div class="border rounded p-0 text-center bg-light d-flex flex-column justify-content-center align-items-center" style="height: 450px; overflow: hidden;">
                <img id="previewImage" src="#" alt="상품 이미지 미리보기" class="img-fluid" style="max-height: 100%; max-width: 100%; object-fit: contain; display: none;">
                <div id="imagePlaceholder" class="d-flex flex-column justify-content-center align-items-center h-100 w-100">
                    <i class="bi bi-image fs-1 text-muted"></i>
                    <p class="text-muted mt-2 mb-0">이미지 준비중</p>
                </div>
            </div>
        </div>
        
        <!-- 우측 상품 상세 정보 -->
        <div class="col-md-7">
            <div class="ms-3">
                <!-- 판매자 및 계좌 정보 -->
                <div class="mb-4">
                    <div class="p-3 bg-light rounded border">
                        <div class="row">
                            <div class="col-6">
                                <span class="fs-5 text-muted">판매자 :</span>
                                <span class="fs-5 fw-bold ms-2">${member.nickname}</span>	
                            </div>
                            <div class="col-6">
                                <span class="fs-5 text-muted">계좌번호 :</span>
                                <span class="fs-5 fw-bold ms-2">${item.bankAccountNumber}</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 상품 설명 -->
                <div class="mb-4">
                    <h5 class="mb-3">상품 상세설명</h5>
                    <p class="mb-2 fs-6">${fn:replace(item.description, '\\n', '<br>')}</p>
                </div>
                
                <!-- 가격 정보 -->
                <div class="mb-4">
                    <div class="d-flex align-items-center mb-2">
                        <span class="me-3 fs-5">판매가 :</span>
                        <h3 class="text-danger fw-bold mb-0">${item.price}원</h3>
                    </div>
                    <div class="d-flex align-items-center">
                        <span class="me-3 fs-6">남은 수량 :</span>
                        <span class="fs-5 fw-bold text-primary">${item.amount}개</span>
                        <small class="text-muted ms-4">등록일: ${item.createdAt}</small>
                    </div>
                </div>
                
                <!-- 수량 선택 -->
                <div class="mb-4">
                    <div class="row align-items-center">
                        <div class="col-3">
                            <label for="quantity" class="form-label mb-0 fs-5">수량선택 :</label>
                        </div>
                        <div class="col-3">
                            <input type="number" class="form-control form-control-lg" id="quantity" value="1" min="1" max="${item.amount}">
                        </div>
                    </div>
                </div>
                
                <!-- 총 상품 금액 -->
                <div class="mb-4">
                    <div class="d-flex justify-content-between align-items-center p-4 bg-light rounded border">
                        <span class="fw-bold fs-5">총 상품 금액</span>
                        <span class="fw-bold text-danger fs-4" id="totalPrice">${item.price}원</span>
                    </div>
                </div>
                
                <!-- 구매 버튼들 -->
                <div class="row g-2">
                    <div class="col-6">
                        <button class="btn btn-outline-primary btn-lg w-100" type="button">
                            장바구니
                        </button>
                    </div>
                    <div class="col-6">
                        <button class="btn btn-dark btn-lg fw-bold w-100" type="button">
                            바로구매
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 댓글/문의 섹션 -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-11 col-md-12">
    <div class="row">
        <div class="col-12">
        	<div class="btn btn-primary btn-sm" id="image_add">사진올리기</div>
            <h5 class="mb-3">상품 문의</h5>
            
            <!-- 댓글 목록 (예시) -->
            <div class="border rounded p-3 mb-3">
                <div class="d-flex align-items-start mb-2">
                    <i class="bi bi-person-circle fs-4 me-2"></i>
                    <div class="flex-grow-1">
                        <strong>구매자1</strong>
                        <small class="text-muted ms-2">2일 전</small>
                        <p class="mb-1 mt-1">배송은 어떻게 되나요?</p>
                        
                        <!-- 답글 -->
                        <div class="ms-4 mt-2">
                            <div class="d-flex align-items-start">
                                <i class="bi bi-arrow-return-right me-2 text-muted"></i>
                                <div>
                                    <strong class="text-primary">판매자</strong>
                                    <small class="text-muted ms-2">1일 전</small>
                                    <p class="mb-0 mt-1">입금 확인 후 택배로 발송됩니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="border rounded p-3 mb-3">
                <div class="d-flex align-items-start">
                    <i class="bi bi-person-circle fs-4 me-2"></i>
                    <div class="flex-grow-1">
                        <strong>구매자2</strong>
                        <small class="text-muted ms-2">3일 전</small>
                        <p class="mb-0 mt-1">상품 상태는 어떤가요?</p>
                    </div>
                </div>
            </div>
            
            <!-- 댓글 작성 폼 -->
            <div class="border rounded p-3 bg-light">
                <div class="mb-3">
                    <textarea class="form-control" placeholder="궁금한 점을 문의해보세요" rows="3"></textarea>
                </div>
                <div class="text-end">
                    <button class="btn btn-primary">문의하기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../templete/footer.jsp"></jsp:include>

<input type="file" id="imageUpload" accept="image/*" style="display: none;">

<script>
function updateTotalPrice() {
    const quantityInput = document.getElementById('quantity');
    let quantity = parseInt(quantityInput.value, 10);
    const maxAmount = ${item.amount};
    const unitPrice = ${item.price};

    // 숫자가 아니면 1로 초기화
    if (isNaN(quantity)) {
        quantity = 1;
    }

    // Math.min과 Math.max를 사용하여 수량을 1과 최대 재고 사이로 제한
    quantity = Math.max(1, Math.min(quantity, maxAmount));
    
    // 검증된 값으로 입력 필드를 업데이트 (값이 변경된 경우에만)
    if (parseInt(quantityInput.value, 10) !== quantity) {
        quantityInput.value = quantity;
    }

    const totalPrice = quantity * unitPrice;
    document.getElementById('totalPrice').textContent = totalPrice.toLocaleString() + '원';
}

// 사용자가 입력할 때마다 실시간으로 업데이트하기 위해 'input' 이벤트 리스너 추가
document.getElementById('quantity').addEventListener('input', updateTotalPrice);

// 페이지 로드 시 초기 총액을 설정하기 위해 한 번 실행
window.addEventListener('DOMContentLoaded', updateTotalPrice);

// 이미지 업로드 및 미리보기 스크립트
const imageAddButton = document.getElementById('image_add');
const imageUploadInput = document.getElementById('imageUpload');
const previewImage = document.getElementById('previewImage');
const imagePlaceholder = document.getElementById('imagePlaceholder');

imageAddButton.addEventListener('click', () => {
    imageUploadInput.click(); // 숨겨진 파일 입력 필드 클릭
});

imageUploadInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
            previewImage.src = e.target.result;
            previewImage.style.display = 'block'; // 이미지 표시
            imagePlaceholder.style.display = 'none'; // 플레이스홀더 숨김
        };
        reader.readAsDataURL(file);
    } else {
        previewImage.src = '#';
        previewImage.style.display = 'none'; // 이미지 숨김
        imagePlaceholder.style.display = 'flex'; // 플레이스홀더 표시
    }
});
</script>
</body>
</html>