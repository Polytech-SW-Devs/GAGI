<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 개인정보 수정</title>
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

.edit-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 50px;
	transition: all 0.3s ease;
}

.edit-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.section-header {
	margin-bottom: 40px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ddd;
}

.section-header h3 {
	font-size: 28px;
	font-weight: 500;
	color: #333;
}

.edit-form {
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
	padding: 15px;
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

.button-group {
	display: flex;
	gap: 15px;
	margin-top: 20px;
	justify-content: flex-end;
}

.btn {
	padding: 15px 40px;
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
	
	.edit-section {
		padding: 30px 20px;
	}
	
	.button-group {
		flex-direction: column;
	}
	
	.btn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<%@ include file="../templete/header.jsp" %>

	<main>
		<div class="container">
			<!-- 사이드바 -->
			<jsp:include page="/WEB-INF/views/templete/mypageSidebar.jsp" />

			<div class="main-content">
				<section class="edit-section">
					<div class="section-header">
						<h3>개인정보 수정</h3>
					</div>

					<c:if test="${not empty message}">
						<div class="message ${messageType}">
							${message}
						</div>
					</c:if>

					<form method="post" class="edit-form">
						<div class="form-group">
							<label for="nickname">닉네임</label>
							<input type="text" id="nickname" name="nickname" value="${member.nickname}" required/>
						</div>

						<div class="form-group">
							<label for="password">비밀번호</label>
							<input type="password" id="password" name="password" placeholder="변경하려면 새 비밀번호를 입력하세요"/>
						</div>

						<div class="form-group">
							<label for="email">이메일</label>
							<input type="email" id="email" name="email" value="${member.email}" required/>
						</div>

						<div class="form-group">
							<label for="phone">휴대폰 번호</label>
							<input type="tel" id="phone" name="phone" value="${member.phone}" required/>
						</div>

						<div class="button-group">
							<a href="<c:url value='/mypage'/>" class="btn btn-secondary">이전</a>
							<button type="submit" class="btn btn-primary">수정하기</button>
						</div>
					</form>
				</section>
			</div>
		</div>
	</main>

	<%@ include file="../templete/footer.jsp" %>
</body>
</html>