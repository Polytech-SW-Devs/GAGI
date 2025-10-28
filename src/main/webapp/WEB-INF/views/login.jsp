<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 로그인</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
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
	padding: 80px 360px 120px;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: calc(100vh - 200px);
}

.login-container {
	width: 100%;
	max-width: 500px;
}

/* 로그인 폼 영역 */
.login-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 60px 50px;
	transition: all 0.3s ease;
}

.login-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.login-header {
	text-align: center;
	margin-bottom: 40px;
	padding-bottom: 30px;
	border-bottom: 2px solid #ddd;
}

.login-header h1 {
	font-size: 32px;
	font-weight: 500;
	color: #333;
	margin-bottom: 10px;
}

.login-header p {
	font-size: 16px;
	color: #666;
}

.login-form {
	display: flex;
	flex-direction: column;
	gap: 25px;
}

.form-group {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.form-group label {
	font-size: 16px;
	font-weight: 500;
	color: #333;
}

.form-group input {
	padding: 18px 20px;
	border: 2px solid #ddd;
	border-radius: 8px;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
	transition: all 0.3s ease;
}

.form-group input:focus {
	outline: none;
	border-color: #501845;
	box-shadow: 0 0 0 3px rgba(80, 24, 69, 0.1);
}

#id-area {
	font-size: 14px;
	color: #666;
	margin-top: 5px;
}

.button-group {
	display: flex;
	gap: 10px;
	margin-top: 10px;
}

.btn {
	flex: 1;
	padding: 18px;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
}

.btn-login {
	background: #501845;
	color: white;
}

.btn-login:hover {
	background: #3d1234;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(80, 24, 69, 0.3);
}

.btn-cancel {
	background: #ddd;
	color: #333;
}

.btn-cancel:hover {
	background: #ccc;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.find-links {
	display: flex;
	justify-content: center;
	gap: 15px;
	margin-top: 25px;
	padding-top: 25px;
	border-top: 1px solid #ddd;
}

.find-links a {
	font-size: 15px;
	color: #666;
	text-decoration: none;
	transition: color 0.3s ease;
}

.find-links a:hover {
	color: #501845;
}

.find-links span {
	color: #ddd;
}

.message {
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 8px;
	text-align: center;
	font-size: 16px;
}

.success {
	background: #d4edda;
	color: #155724;
	border: 1px solid #c3e6cb;
}

.error {
	background: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
}

@media ( max-width : 1600px) {
	main {
		padding: 80px 100px 120px;
	}
}

@media ( max-width : 1400px) {
	main {
		padding: 80px 50px 120px;
	}
}

@media ( max-width : 768px) {
	main {
		padding: 40px 20px 60px;
		min-height: auto;
	}
	.login-section {
		padding: 40px 30px;
	}
	.login-header h1 {
		font-size: 26px;
	}
	.button-group {
		flex-direction: column;
	}
}
</style>
</head>
<body>
	<%@ include file="templete/header.jsp"%>

	<main>
		<div class="login-container">
			<section class="login-section">
				<div class="login-header">
					<h1>로그인</h1>
					<p>가지마켓에 오신 것을 환영합니다</p>
				</div>

				<div id="msg"></div>

				<form name="LoginForm" id="LoginForm"
					action="${pageContext.request.contextPath}/login" method="post"
					class="login-form">
					<div class="form-group">
						<label for="userid">아이디 (이메일)</label> <input type="email"
							name="email" id="userid" placeholder="example@domain.com"
							required />
						<div id="id-area"></div>
					</div>

					<div class="form-group">
						<label for="password">패스워드</label> <input type="password"
							name="password" id="password" placeholder="4~20자로 입력" required />
					</div>

					<div class="button-group">
						<input type="submit" value="로그인" class="btn btn-login" /> <input
							type="button" value="취소" class="btn btn-cancel"
							onclick="location.href='${pageContext.request.contextPath}/'" />
					</div>

					<div class="find-links">
						<a href="${pageContext.request.contextPath}/findId">아이디 찾기</a> <span>|</span>
						<a href="${pageContext.request.contextPath}/findPw">패스워드 찾기</a>
					</div>

					<!-- 회원가입 안내 영역 -->
					<div class="member_join_link"
						style="text-align: center; margin-top: 15px;">
						<span>계정이 없으신가요?</span> <a href="${pageContext.request.contextPath}/join"
							class="text-blue-600 font-semibold" style="margin-left: 5px; color: #501845">
							<strong>회원가입</strong> </a>
					</div>
				</form>
			</section>
		</div>
	</main>

	<c:if test="${not empty success}">
		<script>
			alert("${success}");
		</script>
	</c:if>

	<!-- ===== FOOTER ===== -->
	<jsp:include page="templete/footer.jsp"></jsp:include>
</body>
</html>