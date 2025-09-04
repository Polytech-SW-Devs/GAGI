<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/join.js"></script>
</head>
<body>
	<h1>회원가입..</h1>

    <form name="JoinForm" id="joinForm" action="/join" method="post">
        <div id="msg"></div>
        <table>
            <tr>
                <td>
                	<label for="userid">아이디 (이메일)</label>
                </td>
                <td>
                    <div>
                        <input type="email" name="userid" id="userid" placeholder="example@domain.com" required>
                        <input type="button" onclick="checkId()" value="중복확인">
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
            <tr>
                <td>
                	<label for="username">이름</label>
                </td>
                <td>
                	<input type="text" name="username" id="username" required>
                </td>
            </tr>
            <tr>
                <td>
                	<label for="nickname">닉네임</label>
                </td>
                <td>
                	<div>
                		<input type="text" name="usernick" id="usernick" required>
                		<input type="button" onclick="checkNm()" value="중복확인">
                	</div>
                </td>
            </tr>
            <tr>
                <td>
                	<label for="phone">전화번호</label>
                </td>
                <td>
                	<input type="text" name="phone" id="phone" required>
                </td>
            </tr>
        </table>
        
        <div>
            <input type="submit" value="회원가입">
            <input type="reset" value="다시입력">
            <input type="button" value="홈으로" onclick="location.href='/'">
        </div>
    </form>
</body>
</html>