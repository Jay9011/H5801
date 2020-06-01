<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="JS/submit.js"></script> <!--  로그인 유효성 검사 -->
<title>로그인</title>
</head>

<body>
<h1>로그인</h1>
<form action="loginOk.ho" name="loginFrm" method="post">
아이디 : <input type="text" name="email" placeholder="이메일을 입력해 주세요" value="admin@gmail.com">

<p id="chkid"></p>
비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력해주세요"><p id="chkpw">
</p>
</form>
<button type="button" onclick="chkSubmit()">로그인</button>
<a href="findpw.ho">비밀번호 찾기</a> | <a href="join.ho">회원가입</a>
</body>
</html>