<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 작성</title>
</head>
<body>
	<div>
		<div>
			<h3>내 게시글 작성</h3>
		</div>
		<div>
			<form method="post">

				<div>
					<label for="selectBox">카테고리 선택</label>
					<select id="selectBox" name="categoryId">
						<c:forEach var="c" items="${categories}">
							<option value="${c.categoryId}">${c.name}</option>
						</c:forEach>
					</select>
				</div>

				<div>
					<label for="제목">제목</label>
					<input type="text" name="title" placeholder="제목 입력">
				</div>
				<div>
					<label for="내용">내용</label>
					<textarea rows="" cols="" name="content" placeholder="내용 입력"></textarea>
				</div>
				
				<div><button type="submit">등록</button></div>
			</form>
		</div>
	</div>
</body>
</html>