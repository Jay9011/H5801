<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/loginout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
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
location.href="${pageContext.request.contextPath}/User/joinchk.ho";
</script>
<%} else{%>
<section class="container section scrollspy" id="intro">
	 <div class="row">
	    <div class="col m1 "></div>
		<div class="input-field col m10 s12">
			<h1 class="center-align pfont">이메일 인증 하기</h1>
			<h6 class="center-align pfont">회원가입을 위해서는 이메일 인증은 필수 입니다.</h6>
            <form name="joinEmailFrm" action="${pageContext.request.contextPath}/User/joinEmailOk.ho" method="post" >
            	<div class="row">
				  <div class="col m1 "></div>
                        <div class="input-field col m10 s12">
                    	<input id="email_inline" type="email" name="email" class= "validate"/>
            			<label for="email_inline">이메일(아이디)</label>
                 		<span id="chkEmail" class="helper-text"></span>
                 	</div>
                 	 <div class="col s1 m1"></div>
                 </div>
			</form>
			<div class="row">
				<div class="col s12 14 center-align">
	                <button type="button" class="btn waves-effect" onclick="joinEmailSubmit()">확인</button>
	             </div>
          	</div>
			</div>
		 <div class="col m1 "></div>
	</div>
</section>
<%} %>
<jsp:include page="../foot.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/submit.js"></script> <!--  로그인 유효성 검사 -->
</body>
</html>