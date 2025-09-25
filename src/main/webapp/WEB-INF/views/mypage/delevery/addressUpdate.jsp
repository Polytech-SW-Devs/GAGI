<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	body {
        background-color: #f8f9fa;
    }
    .card {
        max-width: 600px;
        margin: 50px auto;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .card h5 {
        font-weight: 600;
        color: #343a40;
    }
    .form-label {
        font-weight: 500;
    }
    .btn-address-search {
        margin-top: 5px;
    }
</style>
</head>
<body>
<div class="card p-4">
	<h5 class="mb-4 text-center">배송지 수정 페이지</h5>
	
	<form method="post">
	    <div class="mb-3">
	        <label class="form-label">배송지명</label>
	        <input type="text" class="form-control" id="deliveryNameInput" name="deleveryPickup" placeholder="예) 우리집" value="${address.deleveryPickup}"/>
	    </div>
	
	    <div class="mb-3">
	        <label class="form-label">수령인</label>
	        <input type="text" class="form-control" id="recipientNameInput" name="deleveryName" placeholder="이름" required value="${address.deleveryName}"/>
	    </div>
	
	    <div class="mb-3">
	        <label class="form-label">주소</label>
	        <div class="input-group mb-2">
	            <input type="text" class="form-control" id="zipCodeInput" name="zipCode" placeholder="우편번호" readonly required value="${address.zipCode}">
	            <button type="button" class="btn btn-outline-secondary btn-address-search" onclick="openDaumPostcode()">우편번호 찾기</button>
	        </div>
	        <input type="text" class="form-control mb-2" id="addressInput" name="address" placeholder="주소" readonly required value="${address.address}">
	        <input type="text" class="form-control" id="detailAddressInput" name="addressDetail" placeholder="상세주소 (100자 이내)" maxlength="100" value="${address.addressDetail}">
	    </div>
	
	    <div class="mb-3">
	    	<c:choose>
	    		<c:when test="${address.isDefault eq 'Y'}">
	        		<input type="hidden" name="isDefault" value="Y">
	        	</c:when>
	        	<c:otherwise>
	        		<div class="form-check">
		        		<input type="checkbox" class="form-check-input" id="defaultAddressCheckbox" name="isDefault" value="Y">
		        		<label class="form-check-label" for="defaultAddressCheckbox">기본 배송지로 설정</label>
	        		</div>
	        	</c:otherwise>
	        </c:choose>
	    </div>
	
	    <div class="mb-3">
	        <label class="form-label">휴대폰 번호</label>
	        <input type="tel" class="form-control" id="phoneInput" name="phone" placeholder="010-1234-5678" pattern="\d{3}-\d{3,4}-\d{4}" required value="${address.phone}">
	    </div>
	
	    <div class="d-flex justify-content-end gap-2">
	    	<a href="../delevery/addressList" class="btn btn-outline-secondary">이전</a>
	        <button type="submit" class="btn btn-primary">저장</button>
	    </div>
	</form>
</div>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.js"></script>
</body>
</html>
