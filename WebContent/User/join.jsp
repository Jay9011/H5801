<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
<!-- 주소 API  -->
<title>JOIN</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<%
String agree1 = request.getParameter("agree1");
String agree2 = request.getParameter("agree2");

if(agree1 == null || agree2 == null){%>
<script>
location.href="joinchk.ho";
</script>
<%} else{%>
<h1>회원가입</h1>
<form action="joinOk.ho" name="joinFrm" method="post">
<p>이름 : <input type="text" name="name" id="name"></p>
<p id="chkName"></p>
<p>닉네임 : <input type="text"name="nick" id="nick" onkeyup="chknick(nick.value);"></p>
<p id="chkNick"></p>
<p>이메일: <input type="email" name="email" id="email" onkeyup="chkemail(email.value);"></p>
<p id="chkEmail"></p>
<p>비밀번호 : <input type="password" name="pw" id="pw"> 비밀번호 확인: <input type="password" name="pwchk" id="pwchk" onkeyup="chkPwd();"></p>
<p id="chkPW"></p>
<p>생년월일 : <input type="text" name="birth" id="birth" maxlength="10" > 성별 : <label >남자<input type="radio" name="gender" value="남자" checked></label> 
    <label>여자<input type="radio" name="gender" value="여자"></label></p>
    <p id="chkBirth"></p>
    <p>핸드폰 : <input type="tel" name="phoneNum" id="phoneNum" maxlength="13"> sms 수신여부 <label>동의<input type="radio" name="smsok" value="1" checked></label> 
<label>비동의<input type="radio" name="smsok" value="0"></label></p>
    <p id="chkPhone"></p>
<p>주소 : <input type="text" name="addressA" id="addressA" placeholder="주소" readonly onclick="exeAddress();"/> <input type="text" name="addressB" id="addressB" placeholder="상세주소"></p>
<p id="chkAddr"></p>
</form>
<button type="button" onclick="joinmit()">회원가입</button>
<%} %>
<jsp:include page="../foot.jsp"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../JS/submit.js"></script> <!--  로그인 유효성 검사 -->
<script type="text/javascript" src="../JS/chkInform.js"></script> 
<script type="text/javascript" src="../JS/addrAPI.js"></script>
</body>
</html>