<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <div>
        <div>
            <h3>개인정보 수정 페이지</h3>
        </div>
        
        <div>
            <form method="post">
                <div>
                    <label for="nickname">닉네임</label>
                    <input type="text" name="nickname" value="${member.nickname}"/>
                </div>
                <div>
                    <label for="password">비밀번호</label>
                    <input type="password" name="password" value="${member.password}"/>
                </div>
                <div>
                    <label for="email">이메일</label>
                    <input type="text" name="email" value="${member.email}"/>
                </div>
                <div>
                    <label for="phone">휴대폰 번호</label>
                    <input type="text" name="phone" value="${member.phone}"/>
                </div>
                <div>
                	<label for="address">주소</label>
                    <input type="text" name="addresses.zipCode" value="${member.addresses[0].zipCode}"/>
                    <button type="button" onclick="Postcode()">주소 찾기</button>
                    
                    <input type="text" name="addresses.address" value="${member.addresses[1].address}"/>
                    <input type="text" name="addresses.addressDetail" value="${member.addresses[2].addressDetail}"/>
                </div>
                <div>
                    <button type="submit">수정하기</button>
                    <a href="/mypage"><button type="button">이전</button></a>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소
            var extraAddr = ''; // 참고항목

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress; // 도로명
            } else {
                addr = data.jibunAddress; // 지번
            }

            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementsByName("addresses.extraAddress")[0].value = extraAddr;
            } else {
                document.getElementsByName("addresses.extraAddress")[0].value = '';
            }

            document.getElementsByName("addresses.zipCode")[0].value = data.zonecode;
            document.getElementsByName("addresses.address")[0].value = addr;
            document.getElementsByName("addresses.addressDetail")[0].focus();
        }
    }).open();
}

</script>
</html>