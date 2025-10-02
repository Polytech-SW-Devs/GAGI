<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
</head>
<body>
    <div>
        <div>
            <h3>개인정보 수정 페이지</h3>
        </div>
        
        <div>
            <form method="post">
                <div>
                    <label for="nickname">닉네임</label>
                    <input type="text" name="nickname" value="${member.nickname}"/>
                </div>
                <div>
                    <label for="password">비밀번호</label>
                    <input type="password" name="password" value="${member.password}"/>
                </div>
                <div>
                    <label for="email">이메일</label>
                    <input type="text" name="email" value="${member.email}"/>
                </div>
                <div>
                    <label for="phone">휴대폰 번호</label>
                    <input type="text" name="phone" value="${member.phone}"/>
                </div>
                <div>
                    <button type="submit">수정하기</button>
                    <a href="/mypage"><button type="button">이전</button></a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>