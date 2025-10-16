<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가지마켓 - 아이디 찾기 결과</title>
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

.result-container {
	width: 100%;
	max-width: 500px;
}

/* 결과 표시 영역 */
.result-section {
	background: white;
	border: 2px solid #ddd;
	border-radius: 15px;
	padding: 50px 45px;
	transition: all 0.3s ease;
}

.result-section:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.result-header {
	text-align: center;
	margin-bottom: 35px;
	padding-bottom: 25px;
	border-bottom: 2px solid #ddd;
}

.result-header h1 {
	font-size: 28px;
	font-weight: 500;
	color: #333;
	margin-bottom: 8px;
}

.result-header p {
	font-size: 14px;
	color: #666;
}

.result-box {
	background: #d4edda;
	border: 2px solid #c3e6cb;
	border-radius: 10px;
	padding: 30px;
	text-align: center;
	margin-bottom: 30px;
}

.result-box p {
	font-size: 16px;
	color: #155724;
	margin-bottom: 15px;
	line-height: 1.6;
}

.result-box .email {
	font-size: 20px;
	font-weight: 700;
	color: #501845;
	padding: 15px 20px;
	background: white;
	border-radius: 8px;
	display: inline-block;
	margin-top: 10px;
}

.button-group {
	display: flex;
	gap: 10px;
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
	
	.result-section {
		padding: 40px 30px;
	}
	
	.result-header h1 {
		font-size: 24px;
	}
	
	.result-box .email {
		font-size: 18px;
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
		<div class="result-container">
			<section class="result-section">
				<div class="result-header">
					<h1>아이디 찾기 결과</h1>
					<p>회원님의 아이디를 찾았습니다</p>
				</div>

				<div class="result-box">
					<p>회원님의 아이디는</p>
					<div class="email">${email}</div>
					<p style="margin-top: 15px;">입니다.</p>
				</div>

				<div class="button-group">
					<a href="<c:url value='/login'/>" class="btn btn-primary">로그인</a>
					<a href="<c:url value='/findPw'/>" class="btn btn-secondary">비밀번호 찾기</a>
				</div>
			</section>
		</div>
	</main>

	<!-- ===== FOOTER ===== -->
	<jsp:include page="templete/footer.jsp"></jsp:include>
</body>
</html>