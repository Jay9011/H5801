<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<h1>Login</h1>
<form action="LoginOk.ho" name="loginForm" method="post">
	<label for="LoginId">아이디</label>
	<input id="LoginId" name="m_email" type="text" />
	<label for="LoginPw">비밀번호</label>
	<input id="LoginPw" name="m_pw" type="password" />
	<input type="submit" value="로그인"/>
</form>
</body>
</html>