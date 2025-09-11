<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
</head>
<body>
	<h1>후기 작성</h1>
    
    <form method="post" action="${pageContext.request.contextPath}/review/write">
    
    	<!-- 주문 아이템 ID(필수) -->
    	<p>
        	<label>주문 아이템 ID</label><br>
        	<input type="number" name="order_item_id" required>
    	</p>
    	
    	<!-- 대상 ID(상품 등) -->
    	<p>
        	<label>대상 ID</label><br>
        	<input type="number" name="target_id" required>
    	</p>
    	
    	<!-- 평점 -->
    	<p>
        	<label>평점</label><br>
        	<input type="number" name="rating_number" min="1" max="5" required>
    	</p>
    	
    	<!-- 내용 -->
    	<p>
    		<label>후기 내용</label>
    		<textarea name="comment_text" rows="8" cols="50" required></textarea>
    	</p>
    	
    	<button type="submit">저장</button>
	</form>
	
	<a href="${pageContext.request.contextPath}/review/list">목록으로</a>

</body>
</html>
</body>
</html>