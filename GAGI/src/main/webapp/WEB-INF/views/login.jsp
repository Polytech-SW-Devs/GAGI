<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
        	 <input type="submit" value="회원가입" onclick="location.href='join'"> 
            <a href="javascript:void(0)" onclick="findId()">아이디 찾기</a>
            <a href="javascript:void(0)" onclick="findPw()">패스워드 찾기</a>
        </div>
    </form>
</body>
</html>