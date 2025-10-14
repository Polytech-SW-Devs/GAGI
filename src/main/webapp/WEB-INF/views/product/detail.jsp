<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GAGI Market </title>
</head>
<body>

<jsp:include page="../templete/headerLogin.jsp"></jsp:include>

<div>
    <div>
        <div >
		    <!-- 상품 제목 및 기본 정보 -->
		    <div>
		        <div >
		            <h4>${item.title}</h4>
		        </div>
		    </div>
		    
		    <!-- 메인 상품 정보 -->
		    <div>
		        <!-- 좌측 이미지 영역 -->
		        <div >
		            <div>
		                <img src="${pageContext.request.contextPath}/upload/${item.fileName}" alt="상품 이미지 미리보기" >
		                <div id="imagePlaceholder">
		                    <i></i>
		                    <p>이미지 준비중</p>
		                </div>
		            </div>
		        </div>
		        
		        <!-- 우측 상품 상세 정보 -->
		        <div>
		            <div>
		                <!-- 판매자 및 계좌 정보 -->
		                <div>
		                    <div>
		                        <div>
		                            <div>
		                                <span>판매자 :</span>
		                                <span>${member.nickname}</span>	
		                            </div>
		                            <div>
		                                <span>계좌번호 :</span>
		                                <span>${item.bankAccountNumber}</span>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                
		                <!-- 상품 설명 -->
		                <div>
		                    <h5>상품 상세설명</h5>
		                    <p>${fn:replace(item.description, '\\n', '<br>')}</p>
		                </div>
		                
		                <!-- 가격 정보 -->
		                <div>
		                    <div>
		                        <span>판매가 :</span>
		                        <h3>${item.price}원</h3>
		                    </div>
		                    <div>
		                        <span>남은 수량 :</span>
		                        <span>${item.amount}개</span>
		                        <small>등록일: ${item.createdAt}</small>
		                    </div>
		                </div>
		                
		                <!-- 수량 선택 -->
		                <div>
		                    <div >
		                        <div >
		                            <label for="quantity" >수량선택 :</label>
		                        </div>
		                        <div></div>
		                            <input type="number" id="quantity" value="1" min="1" max="${item.amount}">
		                        </div>
		                    </div>
		                </div>
		                
		                <!-- 총 상품 금액 -->
		                <div>
		                    <div>
		                        <span>총 상품 금액</span>
		                        <span id="totalPrice">${item.price}원</span>
		                    </div>
		                </div>
		                
		                <!-- 구매 버튼들 -->
		                <div>
		                    <div >
		                        <button type="button" id="addToCartBtn">
		                            장바구니
		                        </button>
		                    </div>
		                    <div>
		                        <button type="button">
		                            바로구매
		                        </button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>	


<!-- 댓글/문의 섹션 -->
<div >
    <div >
        <div >
		    <div >
		        <div >
		        	<div id="image_add">사진올리기</div>
		            <h5>상품 문의</h5>
		            
		            <!-- 댓글 목록 (예시) -->
		            <div>
		                <div>
		                    <i ></i>
		                    <div>
		                        <strong>구매자1</strong>
		                        <small>2일 전</small>
		                        <p>배송은 어떻게 되나요?</p>
		                        
		                        <!-- 답글 -->
		                        <div>
		                            <div>
		                                <i></i>
		                                <div>
		                                    <strong>판매자</strong>
		                                    <small>1일 전</small>
		                                    <p>입금 확인 후 택배로 발송됩니다.</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            <div>
		                <div>
		                    <i></i>
		                    <div>
		                        <strong>구매자2</strong>
		                        <small>3일 전</small>
		                        <p>상품 상태는 어떤가요?</p>
		                    </div>
		                </div>
		            </div>
		            
		            <!-- 댓글 작성 폼 -->
		            <div>
		                <div>
		                    <textarea class="form-control" placeholder="궁금한 점을 문의해보세요" rows="3"></textarea>
		                </div>
		                <div class="text-end">
		                    <button >문의하기</button>
		                </div>
		            </div>
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



const userId = parseInt('${loginUser != null ? loginUser.id : 0}', 10);
const itemId = parseInt('${item.id}', 10);
console.log("loginUser.id =", "${sessionScope.loginUser.id}");
console.log("loginUser 객체 =", "${sessionScope.loginUser}");

console.log("userId raw:", '${loginUser != null ? loginUser.id : 0}');
const userIdInt = parseInt('${loginUser != null ? loginUser.id : 0}', 10);
console.log("userIdInt:", userIdInt);

document.getElementById('addToCartBtn').addEventListener('click', () => {
    const quantity = parseInt(document.getElementById('quantity').value, 10) || 1;

    if (userId === 0) {
        alert('로그인이 필요합니다.');
        return;
    }

    const formData = new URLSearchParams();
    formData.append("userId", userIdInt);
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
</script>
</body>
</html>