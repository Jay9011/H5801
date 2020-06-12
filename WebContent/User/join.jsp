<%@page import="java.nio.channels.SeekableByteChannel"%>
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
 	 <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
</head>
<body> 
<%
String chk = (String)session.getAttribute("chk");
String email_chk =(String)session.getAttribute("email_chk"); 
 if(chk == null ||chk.equals("NO") || email_chk == null){%>
 <jsp:include page="../modal.jsp"/>
		<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:olive'>유효하지 않은 경로입니다.</h5>
	      			<p class="left-align">이메일 인증 시간이 지났거나 잘못된 경로로 들어왔습니다.</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/User/joinchk.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>
		<script>
document.addEventListener('DOMContentLoaded', function () {
    var Modalelem = document.querySelector('.modal');
    var instance = M.Modal.init(Modalelem, {dismissible:false, preventScrolling:false});
    instance.open();
});
		</script>

<%} else{%>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>

<section class="container section scrollspy" id="intro">
      <div class="row">
            <div class="col s1"></div>
          <div class="col s10">
              <h1 class="center-align pfont">JOIN</h1>
              <form action="joinOk.ho" name="joinFrm" method="post">
                  <div class="row">
                      <div class="input-field col s12">
                          <input type="text" name="name" id="name" class="validate">
                          <label for="name">이름</label>
                          <span id="chkName" class="helper-text"></span>
                      </div>
                  </div>
                  <div class="row">
                      <div class="input-field col s12 m6">
                          <input type="text" name="nick" id="nick" class="validate" onkeyup="chknick(nick.value);">
                          <label for="nick">닉네임</label>
                          <span id="chkNick" class="helper-text"></span>
                      </div>
                       <div class="input-field col s12 m6">
                          <input type="email" name="email" id="email" class="validate" value="<%=email_chk %>">
                          <label for="email">이메일(아이디)</label>
<!--                           <span id="chkEmail" class="helper-text">유효한 이메일을 써주셔야 비밀번호 찾기가 가능합니다.</span> -->
                      </div>
                  </div>
                  <div class="row">
                      <div class="input-field col s12 m6">
                          <input type="password" name="pw" id="pw" class="validate" minlength="4">
                          <label for="pw">비밀번호</label>
                      </div>
                       <div class="input-field col s12 m6">
                          <input type="password" name="pwchk" id="pwchk" onkeyup="chkPwd();" class="validate"><label
                              for="pwchk" minlength="4">비밀번호 확인</label>
                          <span id="chkPW" class="helper-text">비밀번호는 4자 이상 써주세요</span>
                      </div>
                  </div>
                  <div class="row">
                       <div class="input-field col s12 m6">
                          <input type="text" name="birth" id="birth" maxlength="10" class="validate">
                          <label for="birth">생년월일</label>
                          <span id="chkBirth" class="helper-text">생년월일은 8자리 써주세요</span>
                      </div>
                       <div class="input-field col s12 m6">
                          <p>
                              <span>성별 &emsp;</span>
                              <label>
                                  <input type="radio" name="gender" value="남자" checked>
                                  <span>남자</span>
                              </label> &emsp;
                              <label>
                                  <input type="radio" name="gender" value="여자">
                                  <span>여자</span>
                              </label>
                          </p>
                      </div>
                  </div>
                  <div class="row">
                       <div class="input-field col s12 m6">
                          <input type="tel" name="phoneNum" id="phoneNum" maxlength="13" class="validate">
                          <label for="phoneNum">핸드폰</label>
                          <span id="chkPhone" class="helper-text">핸드폰 번호를 정확히 기제해 주세요</span>
                      </div>
                    <div class="input-field col s12 m6">
                          <p>
                              <span>SMS 수신여부 &emsp;</span>
                              <label>
                                  <input type="radio" name="smsok" value="1" checked>
                                  <span>동의</span>
                              </label> &emsp;
                              <label>
                                  <input type="radio" name="smsok" value="0">
                                  <span>비동의</span>
                              </label>
                          </p>
                      </div>
                  </div>
                  <div class="row">
                  <div class="input-field col s12 m6">
                          <input type="text" name="addressA" class="validate" id="addressA" readonly
                              onclick="exeAddress();" placeholder="주소" /> 
                          <span id="chkAddr" class="helper-text">클릭하여 주소를 입력해 주세요.</span>
                      </div>
                       <div class="input-field col s12 m6">
                          <input type="text" name="addressB" id="addressB">
                          <label for="addressB">상세 주소</label>
                      </div>
                  </div>
              </form>
              <div class="row">
                  <div class="col s12 14 center-align">
                      <button type="button" class="btn waves-effect" onclick="joinmit()">회원가입</button>
                  </div>
              </div>
          </div>
                <div class="col s1"></div>
      </div>
  </section>
<jsp:include page="../foot.jsp"/>
<!-- 주소 API  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/submit.js"></script> <!--  로그인 유효성 검사 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/chkInform.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/addrAPI.js"></script>
<%} %>
<script type="text/javascript" src="../JS/modal.js"></script>
</body>
</html>