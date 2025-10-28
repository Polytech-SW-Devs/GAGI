<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 비밀번호 변경</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
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

.update-container {
	width: 100%;
	max-width: 500px;
}

/* 비밀번호 변경 폼 영역 */
.update-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 50px 45px;
	transition: all 0.3s ease;
}

.update-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.update-header {
	text-align: center;
	margin-bottom: 35px;
	padding-bottom: 25px;
	border-bottom: 2px solid #ddd;
}

.update-header h1 {
	font-size: 28px;
	font-weight: 500;
	color: #333;
	margin-bottom: 8px;
}

.update-header p {
	font-size: 14px;
	color: #666;
}

.update-form {
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

.form-group input[type="password"] {
	padding: 16px 18px;
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

.error-message {
	background: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
	padding: 12px 15px;
	border-radius: 8px;
	font-size: 14px;
	text-align: center;
}

.button-group {
	display: flex;
	gap: 10px;
	margin-top: 15px;
}

.btn {
	flex: 1;
	padding: 16px;
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

@media (max-width: 1600px) {
	main {
		padding: 80px 100px 120px;
	}
}

@media (max-width: 1400px) {
	main {
		padding: 80px 50px 120px;
	}
}

@media (max-width: 768px) {
	main {
		padding: 40px 20px 60px;
		min-height: auto;
	}
	
	.update-section {
		padding: 40px 30px;
	}
	
	.update-header h1 {
		font-size: 24px;
	}
	
	.button-group {
		flex-direction: column;
	}
}
</style>
</head>
<body>
	<%@ include file="templete/header.jsp" %>

	<main>
		<div class="update-container">
			<section class="update-section">
				<div class="update-header">
					<h1>비밀번호 변경</h1>
					<p>새로운 비밀번호를 입력해주세요</p>
				</div>

				<form action="${pageContext.request.contextPath}/updatePw" method="post" class="update-form">
					<!-- 숨겨진 이메일 전달 -->
					<input type="hidden" name="email" value="${email}" />
					
					<div class="form-group">
						<label for="newPassword">새 비밀번호</label>
						<input type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호를 입력하세요" required/>
					</div>

					<div class="form-group">
						<label for="confirmPassword">비밀번호 확인</label>
						<input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호를 다시 입력하세요" required/>
					</div>

					<c:if test="${not empty error}">
						<div class="error-message">${error}</div>
					</c:if>

					<div class="button-group">
						<button type="submit" class="btn btn-primary">비밀번호 변경</button>
						<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/login'">취소</button>
					</div>
				</form>
			</section>
		</div>
	</main>

	<!-- ===== FOOTER ===== -->
	<jsp:include page="templete/footer.jsp"></jsp:include>
</body>
</html>