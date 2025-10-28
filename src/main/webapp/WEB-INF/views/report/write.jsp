<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 작성</title>
</head>
<body>
	<h1>신고 작성</h1>

    	<!-- POST는 BaseBoardController write(T, session) -->
        <form action="${pageContext.request.contextPath}/report/write" method="post" enctype="multipart/form-data">

        	<table>
        		<tr>
            		<th>주문상품번호</th>
            		<td><input type="text" name="orderItemId" required></td>
        		</tr>

        		<tr>
            		<th>신고유형</th>
            		<td>
                		<select name="defectType" required>
                    		<option value="">선택</option>
                    		<option value="상품불량">상품불량</option>
                    		<option value="오배송">오배송</option>
                    		<option value="기타">기타</option>
                		</select>
            		</td>
        		</tr>
        		<tr>
            		<th>신고내용</th>
            		<td><textarea name="description" rows="5" cols="40" required></textarea></td>
        		</tr>
        		<tr>
            		<th>첨부이미지</th>
            		<td><input type="file" name="imageFile" accept="image/*"></td>
        		</tr>
    		</table>
    		
    		<button type="submit">등록</button>
    		<a href="${pageContext.request.contextPath}/report/list">목록</a>
		</form>
</body>
</html>