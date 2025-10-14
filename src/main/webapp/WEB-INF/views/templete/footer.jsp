<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background: white;
}
/* ===== FOOTER ===== */
footer {
	width: 100%;
	background: white;
	border-top: 1px solid #DDDDDD;
	padding: 60px 360px;
	text-align: center;
}

.footer-links {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 15px;
	margin-bottom: 10px;
	flex-wrap: wrap;
}

.footer-links a {
	color: black;
	font-size: 16px;
	text-decoration: none;
}

.footer-dot {
	width: 5px;
	height: 5px;
	background: #D9D9D9;
	border-radius: 50%;
}

.footer-info {
	color: #999999;
	font-size: 16px;
	line-height: 28px;
	margin-top: 10px;
}
</style>
<!-- ===== FOOTER ===== -->
<footer>
	<div class="footer-links">
		<a href="#">개인정보처리방침</a>
		<div class="footer-dot"></div>
		<a href="#">저작권보호정책</a>
		<div class="footer-dot"></div>
		<a href="#">뷰어다운로드</a>
		<div class="footer-dot"></div>
		<a href="#">대전폴리텍</a>
	</div>
	<div class="footer-info">[34503] 대전광역시 동구 우암로 352-21
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEL 042-670-0600 (입학문의 대표번호
		1588-2282) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAX 042-670-0519</div>
	<div class="footer-info">COPYRIGHT 2010 BY KOREA POLYTECHNICS.
		ALL RIGHTS RESERVED.</div>
</footer>
</body>
</html>