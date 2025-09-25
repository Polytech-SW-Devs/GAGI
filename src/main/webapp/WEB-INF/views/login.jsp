<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>로그인</h1>
    <form name="LoginForm" id="LoginForm" action="${pageContext.request.contextPath}/login" method="post">
        <div id="msg"></div>
        <table>
            <tr>
                <td>
                	<label for="userid">아이디 (이메일)</label>
                </td>
                <td>
                    <div>
                        <input type="email" name="email" id="userid" placeholder="example@domain.com" required>
                    </div>
                </td>
            </tr>    
            <tr>
                <td colspan="2">
                    <div id="id-area"></div> <!-- AJAX 결과 표시 -->
                </td>
            </tr>
            <tr>
                <td>
                	<label for="password">패스워드</label>
                </td>
                <td>
                	<input type="password" name="password" id="password" placeholder="4~20자로 입력" required>
                </td>
            </tr>
        </table>    
        
        <div>
        	<input type="submit" value="로그인">
        	<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/'">
            <a href="${pageContext.request.contextPath}/findId">아이디 찾기</a>
            <a href="${pageContext.request.contextPath}/findPw">패스워드 찾기</a>
        </div>
    </form>
    
    <c:if test="${not empty success}">
	    <script>
	        alert("${success}");
	    </script>
	</c:if>

</body>
</html>