<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <input type="text" id="deliveryNameInput" name="deleveryPickup" placeholder="예) 우리집"/>
    </div>

    <div>
        <label>수령인</label>
        <input type="text" id="recipientNameInput" name="deleveryName" placeholder="이름" required/>
    </div>

    <div>
        <label>주소</label><br>
        <input type="text" id="zipCodeInput" name="zipCode" placeholder="우편번호" readonly required>
        <input type="button" onclick="openDaumPostcode()" value="우편번호 찾기"><br>
        <input type="text" id="addressInput" name="address" placeholder="주소" readonly required><br>
        <input type="text" id="detailAddressInput" name="addressDetail" placeholder="상세주소 (100자 이내)" maxlength="100">
    </div>

    <div>
        <input type="checkbox" id="defaultAddressCheckbox" name="isDefault" value="Y"> 기본 배송지로 설정
    </div>

    <div>
        <label>휴대폰 번호</label>
        <input type="tel" id="phoneInput" name="phone" placeholder="010-1234-5678" pattern="\d{3}-\d{3,4}-\d{4}" required>
    </div>

    <div>
        <button>등록</button>
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
