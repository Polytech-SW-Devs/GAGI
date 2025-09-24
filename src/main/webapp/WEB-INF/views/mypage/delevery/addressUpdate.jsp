<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 등록</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
form div { margin-bottom: 10px; }
input[type=text], input[type=tel] { width: 300px; padding: 5px; }
</style>
</head>
<body>

<h3>배송지 등록 페이지</h3>

<form method="post">
    <div>
        <label>배송지명</label>
        <input type="text" id="deliveryNameInput" name="deleveryPickup" placeholder="예) 우리집" value="${address.deleveryPickup}"/>
    </div>

    <div>
        <label>수령인</label>
        <input type="text" id="recipientNameInput" name="deleveryName" placeholder="이름" required value="${address.deleveryName}"/>
    </div>

    <div>
        <label>주소</label><br>
        <input type="text" id="zipCodeInput" name="zipCode" placeholder="우편번호" readonly required value="${address.zipCode}">
        <input type="button" onclick="openDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" id="addressInput" name="address" placeholder="주소" readonly required value="${address.address}"><br>
        <input type="text" id="detailAddressInput" name="addressDetail" placeholder="상세주소 (100자 이내)" maxlength="100" value="${address.addressDetail}">
    </div>

    <div>
    	<c:choose>
    		<%-- 이미 기본 배송지이면 hidden 처리 --%>
    		<c:when test="${address.isDefault eq 'Y'}">
        		<input type="hidden" name="isDefault" value="Y">
        	</c:when>
        	
        	<%-- 기본 배송지가 아니면 체크박스 표시 --%>
        	<c:otherwise>
        		<input type="checkbox" id="defaultAddressCheckbox" name="isDefault" value="Y">
        		기본 배송지로 설정
        	</c:otherwise>
        </c:choose>
    </div>

    <div>
        <label>휴대폰 번호</label>
        <input type="tel" id="phoneInput" name="phone" placeholder="010-1234-5678" pattern="\d{3}-\d{3,4}-\d{4}" required value="${address.phone}">
    </div>

    <div>
        <button>수정</button>
        <a href="/mypage"><button type="button">이전</button></a>
    </div>

</form>

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
</script>

</body>
</html>
