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
</head>
<body>
<jsp:include page="../templete/headerLogin.jsp"></jsp:include>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-11 col-md-12">
        <form action="<c:url value='/product/add'/>" method="post" enctype="multipart/form-data">
            <!-- 상품 제목 -->
            <div class="row mb-3">
                <div class="col-12">
                    <input type="text" name="title" class="form-control form-control-lg" placeholder="상품 제목을 입력하세요" required>
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
                            <p class="text-muted mt-2 mb-0">이미지를 업로드하세요</p>
                        </div>
                    </div>
                    <div class="mt-2">
                        <button type="button" class="btn btn-primary btn-sm" id="image_add">사진올리기</button>
                        <input type="file" id="imageUpload" name="image" accept="image/*" style="display: none;">
                    </div>
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
