<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../templete/headerLogin.jsp"></jsp:include>
</head>
<body>
	<div>
		<div>
		<div> <h3>상품 등록</h3> </div>
			<div>
			<form method="post">
			    <!-- 카테고리 선택 -->
			    <div class="mb-3">
			        <label for="selectBox" class="form-label">카테고리 선택</label>
			        <select id="selectBox" name="category.categoryId" class="form-select" required>
			            <option value="" disabled 
			                <c:if test="${item.category == null || item.category.categoryId == null}">selected</c:if>>
			                카테고리를 선택하세요
			            </option>
			            <c:forEach var="c" items="${categories}">
			                <option value="${c.categoryId}" 
			                    <c:if test="${item.category != null && c.categoryId == item.category.categoryId}">selected</c:if>>
			                    ${c.name}
			                </option>
			            </c:forEach>
			        </select>
			    </div>

				<!-- 상품명 등록 -->
				<div>
					<div> <label>상품명:</label> </div>
					<div> <input type="text" name="title" placeholder="제목 입력"> </div>
				</div>
				<div>
					<label>상품 설명:</label>
					<textarea rows="" cols="30" name="description" placeholder="상품 설명란"></textarea>
				</div>
				<div>
					<label for="selectBox">원산지:</label>
					<div> <input type="text" name="delivery" placeholder="주소 입력"> </div>
				</div>
				<div>
					<label>직거래 여부:</label>
					<label>
						<input type="radio" name="isDirectDeal" value="N">No
					</label>
					<label>
						<input type="radio" name="isDirectDeal" value="Y">Yes
					</label>
				</div>								
				<div>
					<label>판매자 계좌번호:</label>
					<div> <input type="text" name="bankAccountNumber" placeholder="계좌번호 입력"> </div>
				</div>
				<div>
					<div> <label>판매 가격:</label> </div>
					<div> <input type="number" name="price"> </div>
				</div>
				<div>
					<div> <label>판매 수량:</label> </div>
					<div> <input type="number" name="amount"> </div>
				</div>
				<!-- <div> 
					<div><label>이미지:</label></div> 
					<div><div class="btn btn-primary btn-sm" id="image_add">추가</div></div> 
				</div> -->
				<!-- <div>
					<div></div>
					<ul id="files">
						<li><input type="file" name="uploadFile"></li>
					</ul>
				</div> -->
				
				<div>
					<div> <button>등록</button> </div>
					<div> <a href="../product/list" type="button">취소</a> </div>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>