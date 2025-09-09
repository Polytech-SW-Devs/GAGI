<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="js/join.js"></script>
</head>
<body>
	<h1>회원가입</h1>

    <form name="JoinForm" id="joinForm" action="${pageContext.request.contextPath}/join" method="post">
        <div id="msg"></div>
        <table>
            <tr>
                <td>
                	<label for="userid">아이디 (이메일)</label>
                </td>
                <td>
                    <div>
                        <input type="email" name="email" id="userid" placeholder="example@domain.com" required>
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
                	<label for="username">이름</label>
                </td>
                <td>
                	<input type="text" name="username" id="username" required>
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
            <tr>
                <td>
                	<label for="nickname">닉네임</label>
                </td>
                <td>
                	<div>
                		<input type="text" name="nickname" id="nickname" required>
                		<input type="button" onclick="checkNm()" value="중복확인">
                	</div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="id-area-nickname"></div> <!-- AJAX 결과 표시 -->
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
            <tr>
    			<td>
        			<label for="zipCode">우편번호</label>
    			</td>
    			<td>
        			<input type="text" name="zipCode" id="zipCode" required>
    			</td>
			</tr>
			<tr>
    			<td>
        			<label for="address">주소</label>
    			</td>
    			<td>
        			<input type="text" name="address" id="address" required>
    			</td>
			</tr>
			<tr>
    			<td>
        			<label for="addressDetail">상세주소</label>
    			</td>
    			<td>
        			<input type="text" name="addressDetail" id="addressDetail">
    			</td>
			</tr>
			<tr>
    			<td>
        			<label for="isDefault">기본배송지</label>
    			</td>
    			<td>
        			<select name="isDefault" id="isDefault">
            			<option value="Y">예</option>
            			<option value="N" selected>아니오</option>
        			</select>
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