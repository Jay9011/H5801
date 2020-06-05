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
<title>LOGIN</title>
   </head>
   <body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
      <div class="row">
      <div class="col s1 "></div>
          < <div class="col s10">
              <h1 class="center-align pfont">LOGIN</h1>
              <form action="loginOk.ho" name="loginFrm" method="post">
                  <div class="row">
                         <div class="col m1 "></div>
                        <div class="input-field col m10 s12">
                          <input id="email_inline" type="email" name="email" class="validate">
                          <label for="email_inline">이메일(아이디)</label>
                          <span id="chkid" class="helper-text"></span>
                        </div>
                       <div class="col m1 "></div>
                    </div>
                    <div class="row">
                      <div class="col m1 "></div>
                        <div class="input-field col m10 s12">
                            <input id="password" type="password" name="pw" class="validate" minlength="4">
                            <label for="password">비밀번호</label>
                            <span id="chkpw"class="helper-text"></span>
                        </div>
                        <div class="col m1 "></div>
                    </div>
              </form>
              <div class="row">
                <div class="col s12 14 center-align acolor">
              <a href="${pageContext.request.contextPath}/User/findpw.ho">비밀번호 찾기</a> | <a href="${pageContext.request.contextPath}/User/join.ho">회원가입</a>
              </div>
              </div>
              <div class="row">
                <div class="col s12 14 center-align">
              <button type="button" class="btn waves-effect " onclick="chkSubmit()">로그인</button>
            </div>
          </div>
          <div class="col s1"></div>
      </div>
  </section>
 
<jsp:include page="../foot.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/submit.js"></script> <!--  로그인 유효성 검사 -->
</body>
</html>