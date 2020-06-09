<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-05  01:00 수정
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../modal.jsp"/>
<c:choose>
	<c:when	test="${keyCode != null && uid != 0 }">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/loginout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<title>RESET YOUR PASSWORD</title>
</head>
<script>
window.history.forward();
function blockBack(){window.history.forward();}
</script>
<body onload="blockBack()" onpageshow="if(event.persisted) blockBack();" onunload="">
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	<div class="row">
	  <div class="col m1 "></div>
		<div class="input-field col m10 s12">
            <h1 class="center-align pfont">RESET YOUR PASSWORD</h1>
            <form name="resetPwFrm" action="${pageContext.request.contextPath}/User/resetPwOk.ho" method="post">
            <input type="hidden" name="uid" value="${select_arr[0].uid}"/> <!-- parameter 넘길 때 자주 사용 -->
				<div class="row">
				<div class="col m1 "></div>
                        <div class="input-field col m10 s12">
						<input id="email_inline" type="text" name="chkKeyCode" class="validate">
						<label for="email_inline">인증번호</label>
						<span id="chkKeyCode" class="helper-text"></span>
					</div>
						<div class="col m1 "></div>
				</div>
            	<div class="row">
				<div class="col m1 "></div>
                        <div class="input-field col m10 s12">
						<input id="password" type="password" name="resetPw" class="validate" minlength="4">
						<label for="password">새 비밀번호</label>
						<span id="chkpw1" class="helper-text"></span>
					</div>
					<div class="col m1 "></div>
				</div>
            	<div class="row">
				<div class="col m1 "></div>
                        <div class="input-field col m10 s12">
						<input id="password" type="password" name="confirmPw" class="validate" minlength="4">
						<label for="password">비밀번호 확인</label>
						<span id="chkpw2" class="helper-text"></span>
					</div>
					<div class="col m1 "></div>
				</div>
			</form>
			<div class="row">
				<div class="col s12 14 center-align">
					<button type="button" class="btn waves-effect " onclick="chkKeyCodeSubmit()">확인</button>
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
	</c:when>
	<c:when test="${empty select_arr || fn:length(select_arr) ==0 }">

	 

		<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:red'>※정보 오류!</h5>
	      			<p class="left-align">해당 정보가 삭제되거나 없습니다</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/User/findPw.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>

		</c:when>
		
		<c:otherwise>

		
		<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:red'>※접근 오류!</h5>
	      			<p class="left-align">잘못된 접근입니다. 이메일을 입력해주세요.</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/User/findPw.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>

		
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="../JS/modal.js"></script>