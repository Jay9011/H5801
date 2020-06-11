<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-01  21:00 수정
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/loginout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<title>FIND YOUR PASSWORD</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	 <div class="row">
	    <div class="col m1 "></div>
		<div class="input-field col m10 s12">
			<h1 class="center-align pfont">FIND YOUR PASSWORD</h1>
			<div style="padding: 30px;"></div>
            <form name="findPwFrm" action="${pageContext.request.contextPath}/User/findPwOk.ho" method="post" >
            	<div class="row">
				  <div class="col m1 "></div>
                        <div class="input-field col m10 s12">
                    	<input id="email_inline" type="email" name="email" class= "validate"/>
            			<label for="email_inline">이메일(아이디)</label>
                 		<span id="chkid" class="helper-text"></span>
                 	</div>
                 	 <div class="col s1 m1"></div>
                 </div>
			</form>
			<div class="row">
				<div class="col s12 14 center-align">
	                <button type="button" class="btn waves-effect" onclick="chkEmailSubmit()">확인</button>
	             </div>
          	</div>
			</div>
		 <div class="col m1 "></div>
	</div>
</section>
<jsp:include page="../foot.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/submit.js"></script> <!--  로그인 유효성 검사 -->
</body>
</html>