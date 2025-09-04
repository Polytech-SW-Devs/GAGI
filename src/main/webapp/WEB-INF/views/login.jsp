<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이거 테스트하려고 만들었다.</title>
</head>
<body>
	<h1>로그인</h1>
    <form name="LoginForm" id="LoginForm" action="/login" method="post">
        <div id="msg"></div>
        <table>
            <tr>
                <td>
                	<label for="userid">아이디 (이메일)</label>
                </td>
                <td>
                    <div>
                        <input type="email" name="userid" id="userid" placeholder="example@domain.com" required>
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
                	<label for="userpw">패스워드</label>
                </td>
                <td>
                	<input type="password" name="userpw" id="userpw" placeholder="4~20자로 입력" required>
                </td>
            </tr>
        </table>    
        
        <div>
            <a href="javascript:void(0)" onclick="findId()">아이디 찾기</a>
            <a href="javascript:void(0)" onclick="findPw()">패스워드 찾기</a>
        </div>
    </form>
</body>
</html>