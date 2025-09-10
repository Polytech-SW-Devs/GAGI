<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 성공</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="id-find-box mt-5">
            <h2 class="text-center mb-4">아이디 찾기 결과</h2>
            <div class="alert alert-success text-center">
                회원님의 아이디는 <strong>${email}</strong> 입니다.
            </div>
            <div class="d-flex justify-content-between">
                <a href="/gagi/login" class="btn btn-primary btn-sm">로그인</a>
                <a href="/gagi/findPw" class="btn btn-secondary btn-sm">비밀번호 찾기</a>
            </div>
        </div>
    </div>
</body>
</html>

