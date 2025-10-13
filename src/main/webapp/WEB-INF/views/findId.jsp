<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" >
<meta charset="UTF-8">
<title>GAGI Market 아이디 찾기</title>
<style>
   body {
        background-color: #f8f9fa; 
    }
    .id-find-box {
        max-width: 400px;
        margin: 50px auto; 
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .id-find-box label {
        display: block;
        font-weight: 500;
    }
    .id-find-box input[type="text"],
    .id-find-box input[type="email"] {
        width: 100%;  /* 모든 입력창 동일 너비 */
    }
</style>
</head>
<body>
<div class="id-find-box">
        <h2 class="text-center mb-4">아이디 찾기</h2>

        <form action="<c:url value='/findId' />" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">이름</label>
                <input type="text" name="username" id="username" class="form-control form-control-sm mb-2" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">전화번호</label>
                <input type="text" name="phone" id="phone" class="form-control form-control-sm mb-2" required>
            </div>
            <div class="d-flex justify-content-between">
                <input type="submit" value="아이디 찾기" class="btn btn-primary  btn-sm">
                <input type="button" value="취소" class="btn btn-secondary btn-sm" onclick="location.href='/gagi/login'">
            </div>
        </form>
    </div>

</body>
</html>
