<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
	const contextPath = "${pageContext.request.contextPath}";
</script>

</head>
<body>
	<h1>회원가입</h1>

    <form name="JoinForm" id="joinForm" action="${pageContext.request.contextPath}/join" method="post">
        <table>
            <tr>
                <td>
                	<label for="userid">아이디 (이메일)</label>
                </td>
                <td>
                    <div>
                        <input type="email" name="email" id="userid" onkeyup="validateEmail()" required>
                        <input type="button" onclick="checkId()" value="중복확인">
                        <p id="email-rule-msg" class="error-msg">
                        	* 이메일을 올바르게 입력하세요
                        </p>
                    </div>
                </td>
            </tr>    
            <tr>
                <td colspan="2">
                    <div id="id-area"></div> <!-- AJAX 결과 표시 -->
                </td>
            </tr>
 			<tr>
                <td>
                	<label for="username">이름</label>
                </td>
                <td>
                	<input type="text" name="username" id="username" required>
                </td>
            </tr>
            <tr>
                <td>
                	<label for="password">비밀번호</label>
                </td>
                <td>
                	<input type="password" name="password" id="password" placeholder="4~20자로 입력" onkeyup="validatePassword()" required>
                	<p id="pw-rule-msg" class="error-msg">
                		* 영문/숫자/특수문자 2가지 이상 조합(8~20자)<br>	
                		* 3개 이상 연속되거나 동일한 문자/숫자 제외<br>	
                		* 아이디(이메일) 제외	
                	</p>
                </td>
            </tr>
            <tr>
                <td>
                	<label for="passwordConfirm">비밀번호 확인</label>
                </td>
                <td>
                	<input type="password" id="passwordConfirm" placeholder="비밀번호 확인" onkeyup="checkPwConfirm()" required>
                	<div id="pw-msg"></div>
                </td>
            </tr>
            <tr>
                <td>
                	<label for="nickname">닉네임</label>
                </td>
                <td>
                	<div>
                		<input type="text" name="nickname" id="nickname" onkeyup="validateNickname()" required>
                		<input type="button" onclick="checkNm()" value="중복확인">
                		<p id="nickname-rule-msg" class="error-msg">
                			* 닉네임은 2~10자, 한글/영문/숫자만 사용 가능합니다.
                		</p>
                	</div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="id-area-nickname"></div> <!-- AJAX 결과 표시 -->
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<label for="phone">전화번호</label>
                </td>
                <td>
                	<input type="text" name="phone" id="phone" placeholder="010-1234-5678" onkeyup="validatePhone()" required>
                	<p id="phone-rule-msg" class="error-msg">
                		* 전화번호 형식: 010-1234-5678
                	</p>
                </td>
            </tr>          
        </table>
        
        <!-- 체크박스 영역 -->
    	<div class="checklist">
        	<label><input type="checkbox" required> 휴대폰 인증확인</label><br>
        	<label><input type="checkbox" required> [필수] 만 14세 이상입니다</label><br>
        	<label><input type="checkbox" required> [필수] 개인정보 이용</label><br>
        	<label><input type="checkbox" required> [필수] 고유식별정보 처리</label>
    	</div>
        
        <div>
            <input type="submit" value="회원가입">
            <input type="reset" value="다시입력">
            <input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/'">
        </div>
    </form>
    <script src="${pageContext.request.contextPath}/js/join.js"></script>
</body>
</html>