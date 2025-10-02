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
<jsp:include page="../views/category/category.jsp"></jsp:include>
<jsp:include page="../views/product/totalList.jsp">
	<jsp:param value="${totalList}" name="totalList"/>
</jsp:include>


	
<jsp:include page="../views/templete/footer.jsp"></jsp:include>

</body>
</html>
