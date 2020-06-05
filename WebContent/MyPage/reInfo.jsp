<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:choose>
	<c:when test="${email == null}">
	<script>
				alert("회원이 아니시면 접근할 수 없습니다.");
				location.href="${pageContext.request.contextPath}/index.ho";
			</script>
	</c:when>
	<c:when test="${empty ulist || fn:length(ulist) == 0}">
	<script>
				alert("회원님의 정보가 삭제되었거나 없습니다.");
				location.href="${pageContext.request.contextPath}/index.ho";
			</script>
	</c:when>
	<c:otherwise>
	
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="<c:url value='/'/>CSS/loginout.css">
<title>JOIN</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>

<section class="container section scrollspy" id="intro">
      <div class="row">
           <div class="col m1"></div>
          <div class="col m10 s11">
              <h1 class="center-align pfont">회원 정보 <span>수정</span></h1>
              <form action="reInfoOk.ho" name="reInfoFrm" method="post">
                  <div class="row">
                     <div class="input-field col s12">
                          <input type="text" name="name" id="name" class="validate" value="${ulist[0].name }" readonly>
                          <label for="name">이름</label>
                          <span id="chkName" class="helper-text"></span>
                      </div>
                  </div>
                  <div class="row">
                         <div class="input-field col s12 m6">
                          <input type="text" name="nick" id="nick" class="validate" onkeyup="chknick(nick.value);"  value="${ulist[0].nick }">
                          <label for="nick">닉네임</label>
                          <span id="chkNick" class="helper-text"></span>
                      </div>
                         <div class="input-field col s12 m6">
                          <input type="email" name="email" id="email" class="validate"
                             value="${ulist[0].email }" readonly><label for="email">이메일</label>
                      </div>
                  </div>
                  <div class="row">
                          <div class="input-field col s12 m6">
                          <input type="password" name="pw" id="pw" class="validate" minlength="4"  value="${ulist[0].pw }" readonly>
                          <label for="pw">비밀번호</label>
                      </div>
                         <div class="input-field col s12 m6">
                          <input type="password" name="pwchk" id="pwchk" onkeyup="chkPwd2();" class="validate"><label
                              for="pwchk" minlength="4">비밀번호 확인</label>
                          <span id="chkPW" class="helper-text">비밀번호는 4자 이상 써주세요</span>
                      </div>
                  </div>
                  <div class="row">
                         <div class="input-field col s12 m6">
                          <input type="text" name="birth" id="birth" maxlength="10" class="validate"  value="${ulist[0].birth }" readonly>
                          <label for="birth">생년월일</label>
                      </div>
                       <div class="input-field col s12 m6">
                          <p>
                              <span>성별 &emsp;</span>
                              <c:if test="${ulist[0].gender== '남자'}">
                              <label>
                                  <input type="radio" name="gender" value="남자" checked >
                                  <span>남자</span>
                              </label> &emsp;
                              <label>
                                  <input type="radio" name="gender" value="여자">
                                  <span>여자</span>
                              </label>
                              </c:if>
                               <c:if test="${ulist[0].gender== '여자'}">
                               <label>
                                  <input type="radio" name="gender" value="남자" >
                                  <span>남자</span>
                              </label> &emsp;
                              <label>
                                  <input type="radio" name="gender" value="여자" checked>
                                  <span>여자</span>
                              </label>
                              </c:if>
                          </p>
                      </div>
                  </div>
                  <div class="row">
                      <div class="input-field col s12 m6">
                          <input type="tel" name="phoneNum" id="phoneNum" maxlength="13" class="validate" value="${ulist[0].phoneNum }" >
                          <label for="phoneNum">핸드폰</label>
                          <span id="chkPhone" class="helper-text">핸드폰 번호를 정확히 기제해 주세요</span>
                      </div>
                        <div class="input-field col s12 m6">
                          <p>
                              <span>SMS 수신여부 &emsp;</span>
                                       <c:if test="${ulist[0].smsOk == '1'}">
                               <label>
                                  <input type="radio" name="smsok" value="1" checked>
                                  <span>동의</span>
                              </label> &emsp;
                              <label>
                                  <input type="radio" name="smsok" value="0">
                                  <span>비동의</span>
                              </label>
                              </c:if>
                               <c:if test="${ulist[0].smsOk == '0'}">
                                  <label>
                                  <input type="radio" name="smsok" value="1" >
                                  <span>동의</span>
                              </label> &emsp;
                              <label>
                                  <input type="radio" name="smsok" value="0" checked>
                                  <span>비동의</span>
                              </label>
                              </c:if>
                           
                          </p>
                      </div>
                  </div>
                  <div class="row">
                        <div class="input-field col s12 m6">
                          <input type="text" name="addressA" class="validate" id="addressA" readonly
                              onclick="exeAddress();" value="${ulist[0].addressA }" />
                          <span id="chkAddr" class="helper-text">클릭하여 주소를 입력해 주세요.</span>
                      </div>
                       <div class="input-field col s12 m6">
                          <input type="text" name="addressB" id="addressB" value="${ulist[0].addressB }" >
                          <label for="addressB">상세 주소</label>
                      </div>
                  </div>
              </form>
              <div class="row">
                  <div class="col s12 14 center-align">
                      <button type="button" class="btn waves-effect" onclick="reInfomit()">회원 정보 수정</button>
                  </div>
              </div>
          </div>
                 <div class="col m1"></div>
      </div>
  </section>
<jsp:include page="../foot.jsp"/>
<!-- 주소 API  -->
<script type="text/javascript" src="../JS/submit.js"></script> <!--  로그인 유효성 검사 -->
<script type="text/javascript" src="../JS/chkInform.js"></script> 
<script type="text/javascript" src="../JS/addrAPI.js"></script>
</body>
</html>
	</c:otherwise>
</c:choose>