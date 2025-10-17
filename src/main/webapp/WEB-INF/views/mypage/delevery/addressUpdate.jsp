<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 배송지 수정</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

.address-form-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 40px;
	transition: all 0.3s ease;
}

.address-form-section:hover {
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

.address-form {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.form-group {
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.form-group label {
	font-size: 15px;
	font-weight: 500;
	color: #333;
}

.form-group input[type="text"],
.form-group input[type="tel"] {
	padding: 14px 16px;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all 0.3s ease;
	width: 100%;
}

.form-group input:focus {
	outline: none;
	border-color: #501845;
	box-shadow: 0 0 0 3px rgba(80, 24, 69, 0.1);
}

.form-group input:read-only {
	background-color: #f5f5f5;
	cursor: default;
}

.input-group {
	display: flex;
	gap: 10px;
	margin-bottom: 10px;
}

.input-group input {
	flex: 1;
}

.btn-postcode {
	padding: 14px 20px;
	background: white;
	color: #501845;
	border: 2px solid #501845;
	border-radius: 8px;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
	white-space: nowrap;
}

.btn-postcode:hover {
	background: #501845;
	color: white;
	transform: translateY(-2px);
}

.checkbox-group {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 15px 0;
}

.checkbox-group input[type="checkbox"] {
	width: 20px;
	height: 20px;
	cursor: pointer;
	accent-color: #501845;
}

.checkbox-group label {
	font-size: 15px;
	color: #333;
	cursor: pointer;
	margin: 0;
}

.button-group {
	display: flex;
	gap: 10px;
	margin-top: 20px;
	justify-content: flex-end;
}

.btn {
	padding: 16px 40px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
	text-decoration: none;
	display: inline-block;
	text-align: center;
}

.btn-primary {
	background: #501845;
	color: white;
}

.btn-primary:hover {
	background: #3d1234;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(80, 24, 69, 0.3);
}

.btn-secondary {
	background: #ddd;
	color: #333;
}

.btn-secondary:hover {
	background: #ccc;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
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
	
	.address-form-section {
		padding: 30px 20px;
	}
	
	.button-group {
		flex-direction: column;
	}
	
	.btn {
		width: 100%;
	}
	
	.input-group {
		flex-direction: column;
	}
	
	.btn-postcode {
		width: 100%;
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
				<section class="address-form-section">
					<div class="section-header">
						<h3>배송지 수정</h3>
					</div>

					<form method="post" class="address-form">
						<div class="form-group">
							<label for="deliveryNameInput">배송지명</label>
							<input type="text" id="deliveryNameInput" name="deleveryPickup" placeholder="예) 우리집" value="${address.deleveryPickup}"/>
						</div>

						<div class="form-group">
							<label for="recipientNameInput">수령인</label>
							<input type="text" id="recipientNameInput" name="deleveryName" placeholder="이름을 입력하세요" required value="${address.deleveryName}"/>
						</div>

						<div class="form-group">
							<label>주소</label>
							<div class="input-group">
								<input type="text" id="zipCodeInput" name="zipCode" placeholder="우편번호" readonly required value="${address.zipCode}"/>
								<button type="button" class="btn-postcode" onclick="openDaumPostcode()">우편번호 찾기</button>
							</div>
							<input type="text" id="addressInput" name="address" placeholder="주소" readonly required value="${address.address}"/>
							<input type="text" id="detailAddressInput" name="addressDetail" placeholder="상세주소 (100자 이내)" maxlength="100" value="${address.addressDetail}"/>
						</div>

						<div class="form-group">
							<c:choose>
								<c:when test="${address.isDefault eq 'Y'}">
									<input type="hidden" name="isDefault" value="Y"/>
									<div style="padding: 15px 0; color: #666; font-size: 14px;">
										※ 현재 기본 배송지로 설정되어 있습니다.
									</div>
								</c:when>
								<c:otherwise>
									<div class="checkbox-group">
										<input type="checkbox" id="defaultAddressCheckbox" name="isDefault" value="Y"/>
										<label for="defaultAddressCheckbox">기본 배송지로 설정</label>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="form-group">
							<label for="phoneInput">휴대폰 번호</label>
							<input type="tel" id="phoneInput" name="phone" placeholder="010-1234-5678" pattern="\d{3}-\d{3,4}-\d{4}" required value="${address.phone}"/>
						</div>

						<div class="button-group">
							<a href="<c:url value='/mypage/delevery/addressList'/>" class="btn btn-secondary">이전</a>
							<button type="submit" class="btn btn-primary">저장</button>
						</div>
					</form>
				</section>
			</div>
		</div>
	</main>

	<script>
	function openDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = '';
	            if (data.userSelectedType === 'R') {
	                addr = data.roadAddress;
	            } else {
	                addr = data.jibunAddress;
	            }
	            document.getElementById('zipCodeInput').value = data.zonecode;
	            document.getElementById('addressInput').value = addr;
	            document.getElementById('detailAddressInput').focus();
	        }
	    }).open();
	}

	const phoneInput = document.getElementById('phoneInput');
	phoneInput.addEventListener('input', function() {
	    let num = this.value.replace(/\D/g,'');
	    if(num.length < 4) {
	        this.value = num;
	    } else if(num.length < 7) {
	        this.value = num.replace(/(\d{3})(\d+)/,'$1-$2');
	    } else if(num.length < 11) {
	        this.value = num.replace(/(\d{3})(\d{3,4})(\d+)/,'$1-$2-$3');
	    } else {
	        this.value = num.replace(/(\d{3})(\d{4})(\d{4}).*/,'$1-$2-$3');
	    }
	});
	</script>

	<%@ include file="../../templete/footer.jsp" %>
</body>
</html>