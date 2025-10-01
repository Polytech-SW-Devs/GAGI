<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<jsp:include page="../views/templete/headerLogin.jsp"></jsp:include>
<jsp:include page="../views/product/totalList.jsp">
	<jsp:param value="${totalList}" name="totalList"/>
</jsp:include>


	
<jsp:include page="../views/templete/footer.jsp"></jsp:include>
<div><a href="./test/testUpload">이미지 업로드 테스트</a></div>
</body>
</html>
