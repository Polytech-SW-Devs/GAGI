<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	const contextPath = "${pageContext.request.contextPath}";
</script>
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
	padding: 40px 360px 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.signup-container {
	width: 100%;
	max-width: 700px;
}

/* 회원가입 폼 영역 */
.signup-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 35px 45px;
	transition: all 0.3s ease;
}

.signup-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.signup-header {
	text-align: center;
	margin-bottom: 25px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.signup-header h1 {
	font-size: 28px;
	font-weight: 500;
	color: #333;
	margin-bottom: 5px;
}

.signup-header p {
	font-size: 14px;
	color: #666;
}

.signup-form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.form-group {
	display: flex;
	flex-direction: column;
	gap: 6px;
}

.form-group label {
	font-size: 14px;
	font-weight: 500;
	color: #333;
}

.input-wrapper {
	display: flex;
	gap: 8px;
	align-items: flex-start;
}

.input-wrapper input[type="email"],
.input-wrapper input[type="text"] {
	flex: 1;
}

.form-group input[type="email"],
.form-group input[type="text"],
.form-group input[type="password"],
.form-group input[type="tel"] {
	padding: 14px 16px;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all 0.3s ease;
	width: 100%;
}

.form-group input:focus {
	outline: none;
	border-color: #501845;
	box-shadow: 0 0 0 3px rgba(80, 24, 69, 0.1);
}

.btn-check {
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

.btn-check:hover {
	background: #501845;
	color: white;
	transform: translateY(-2px);
}

.error-msg {
	font-size: 12px;
	color: #dc3545;
	line-height: 1.3;
	margin-top: -2px;
}

#id-area,
#id-area-nickname,
#pw-msg {
	font-size: 12px;
	margin-top: -2px;
}

.checklist {
	background: #f9f9f9;
	border: 2px solid #ddd;
	border-radius: 8px;
	padding: 18px;
	margin-top: 5px;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.checklist label {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 13px;
	color: #333;
	cursor: pointer;
}

.checklist input[type="checkbox"] {
	width: 18px;
	height: 18px;
	cursor: pointer;
	accent-color: #501845;
}

.button-group {
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.btn {
	flex: 1;
	padding: 15px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
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

.btn-cancel {
	background: #666;
	color: white;
}

.btn-cancel:hover {
	background: #555;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

@media (max-width: 1600px) {
	main {
		padding: 40px 100px 50px;
	}
}

@media (max-width: 1400px) {
	main {
		padding: 40px 50px 50px;
	}
}

@media (max-width: 768px) {
	main {
		padding: 30px 20px 40px;
	}
	
	.signup-section {
		padding: 30px 25px;
	}
	
	.signup-header h1 {
		font-size: 24px;
	}
	
	.button-group {
		flex-direction: column;
	}
	
	.input-wrapper {
		flex-direction: column;
	}
	
	.btn-check {
		width: 100%;
	}
}
</style>
</head>
<body>
	<%@ include file="templete/header.jsp" %>

	<main>
		<div class="signup-container">
			<section class="signup-section">
				<div class="signup-header">
					<h1>회원가입</h1>
					<p>가지마켓에 오신 것을 환영합니다</p>
				</div>

				<form name="JoinForm" id="joinForm" action="${pageContext.request.contextPath}/join" method="post" class="signup-form">
					<div class="form-group">
						<label for="userid">아이디 (이메일)</label>
						<div class="input-wrapper">
							<input type="email" name="email" id="userid" placeholder="example@domain.com" onkeyup="validateEmail()" required/>
							<input type="button" onclick="checkId()" value="중복확인" class="btn-check"/>
						</div>
						<p id="email-rule-msg" class="error-msg">* 이메일을 올바르게 입력하세요</p>
						<div id="id-area"></div>
					</div>

					<div class="form-group">
						<label for="username">이름</label>
						<input type="text" name="username" id="username" placeholder="이름을 입력하세요" required/>
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label>
						<input type="password" name="password" id="password" placeholder="8~20자로 입력" onkeyup="validatePassword()" required/>
						<p id="pw-rule-msg" class="error-msg">* 영문/숫자/특수문자 2가지 이상 조합(8~20자), 3개 이상 연속/동일 문자 제외</p>
					</div>

					<div class="form-group">
						<label for="passwordConfirm">비밀번호 확인</label>
						<input type="password" id="passwordConfirm" placeholder="비밀번호를 다시 입력하세요" onkeyup="checkPwConfirm()" required/>
						<div id="pw-msg"></div>
					</div>

					<div class="form-group">
						<label for="nickname">닉네임</label>
						<div class="input-wrapper">
							<input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" onkeyup="validateNickname()" required/>
							<input type="button" onclick="checkNm()" value="중복확인" class="btn-check"/>
						</div>
						<p id="nickname-rule-msg" class="error-msg">* 2~10자, 한글/영문/숫자만 사용 가능</p>
						<div id="id-area-nickname"></div>
					</div>

					<div class="form-group">
						<label for="phone">전화번호</label>
						<input type="tel" name="phone" id="phone" placeholder="010-1234-5678" onkeyup="validatePhone()" required/>
						<p id="phone-rule-msg" class="error-msg">* 전화번호 형식: 010-1234-5678</p>
					</div>

					<div class="checklist">
						<label><input type="checkbox" required/> 휴대폰 인증확인</label>
						<label><input type="checkbox" required/> [필수] 만 14세 이상입니다</label>
						<label><input type="checkbox" required/> [필수] 개인정보 이용</label>
						<label><input type="checkbox" required/> [필수] 고유식별정보 처리</label>
					</div>

					<div class="button-group">
						<input type="submit" value="회원가입" class="btn btn-primary"/>
						<input type="reset" value="다시입력" class="btn btn-secondary"/>
						<input type="button" value="취소" class="btn btn-cancel" onclick="location.href='${pageContext.request.contextPath}/'"/>
					</div>
				</form>
			</section>
		</div>
	</main>

	<script src="${pageContext.request.contextPath}/js/join.js"></script>
	<!-- ===== FOOTER ===== -->
	<jsp:include page="templete/footer.jsp"></jsp:include>
</body>
</html>