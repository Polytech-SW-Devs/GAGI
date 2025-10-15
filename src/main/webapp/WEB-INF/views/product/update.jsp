<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GAGI Market </title>
<script src="${pageContext.request.contextPath}/js/product/ImageUpdate.js"></script>
</head>
<body>
	<div> <h3>상품 등록</h3> </div>
	
	<div>
		<form method="post" enctype="multipart/form-data">
			<div >
				<div>
					<ul id="files">	
	            		<c:forEach var="image" items="${item.itemImages}">
	                        <li class="existing-file">
	                            <img src="${pageContext.request.contextPath}/upload/${image.fileName}" alt="상품 이미지 미리보기" width="300">
	                            <label>
	                                <input type="radio" name="mainImageIndex" value="${image.id}" 
	                                <c:if test="${image.sortOrder == 1}">checked</c:if>> 대표 이미지
	                            </label>
	                            <div class="deleteImage" data-code="${image.id}">삭제</div>
	                        </li>
	                    </c:forEach>
					</ul>
            	</div>
			</div>
			<div>
				<div> <label>이미지:</label> </div>
				<button type="button" id="image_add"> 이미지추가 </button>
			</div>
		
			<div>
				<div> <label>상품명:</label> </div>
				<div> <input type="text" name="title" value="${item.title}" placeholder="제목 입력"> </div>
			</div>
			<div>
				<label>상품 설명:</label>
				<textarea rows="" cols="30" name="description"  placeholder="상품 설명란">${item.description}</textarea>	
			</div>
			<div>
				<label for="selectBox">원산지:</label>
				<div> <input type="text" name="delivery"  value="${item.delivery}" placeholder="주소 입력"> </div>
			</div>
			<div>
				<label>직거래 여부:</label>
				<label>
					<input type="radio" name="isDirectDeal" value="N"
					<c:if test="${item.isDirectDeal == 'N'}">checked</c:if>>No
				</label>
				<label>
					<input type="radio" name="isDirectDeal" value="Y"
					<c:if test="${item.isDirectDeal == 'Y'}">checked</c:if>>Yes
				</label>
			</div>											
			<div>
				<label>판매자 계좌번호:</label>
				<div> <input type="text" name="bankAccountNumber" value="${item.bankAccountNumber}" placeholder="계좌번호 입력"> </div>
			</div>
			<div>
				<div> <label>판매 가격:</label> </div>
				<div> <input type="number" name="price" value="${item.price}"> </div>
			</div>
			<div>
				<div> <label>판매 수량:</label> </div>
				<div> <input type="number" name="amount" value="${item.amount}"> </div>
			</div>
			<div>
				<div> <button>등록</button> </div>
				<div> <a href="../list"> <button type="button">취소</button> </a> </div>
			</div>
		</form>
	</div>
</body>
</html>