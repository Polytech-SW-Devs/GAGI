<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div>
		<div>
			<h2>상품 상세 정보</h2>
		</div>
		
		<div>
			<div> <label>상품명:${item.title}</label> </div>
		</div>
		<div>
			<div> <label>판매자:${member.nickname}</label> </div>
		</div>
		<div>
			<div> <label>계좌번호:${item.bankAccountNumber}</label> </div>
		</div>
		<div>
			<div> <label>이미지:준비중</label> </div>
		</div>
		<div>
			<div> <label>상품 설명:${item.description}</label> </div>
		</div>
		<div>
			<div> <label>가격:${item.price}</label> </div>
		</div>
		<div>
			<div> <label>판매수량:${item.amount}</label> </div>
		</div>
		<div>
			<div>구매수량: 준비중</div>
		</div>
		<div>
			<div> <input type="button" value="구매하기_준비중" onclick="location.href=''" /> </div>
		</div>
		<div>
			<div> <label>상품 등록일:${item.createdAt}</label> </div>
		</div>
		<div>
			<div><a href="${pageContext.request.contextPath}/">이전</a></div>
		</div>
	</div>
	
</body>
</html>