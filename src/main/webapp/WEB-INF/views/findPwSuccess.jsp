<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .pw-update-box {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .pw-update-box label {
            display: block;
            font-weight: 500;
        }
        .pw-update-box input[type="password"] {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="pw-update-box">
    <h2 class="text-center mb-4">비밀번호 변경</h2>

    <form action="${pageContext.request.contextPath}/updatePw" method="post">
        <!-- 숨겨진 이메일 전달 -->
        <input type="hidden" name="email" value="${email}" />

        <div class="mb-3">
            <label for="newPassword" class="form-label">새 비밀번호</label>
            <input type="password" id="newPassword" name="newPassword" class="form-control form-control-sm mb-2" required>
        </div>

        <div class="mb-3">
            <label for="confirmPassword" class="form-label">비밀번호 확인</label>
            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control form-control-sm mb-2" required>
        </div>

        <c:if test="${not empty error}">
            <p class="text-danger small">${error}</p>
        </c:if>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary btn-sm">비밀번호 변경</button>
            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath}/login'">취소</button>
        </div>
    </form>
</div>
</body>
</html>

