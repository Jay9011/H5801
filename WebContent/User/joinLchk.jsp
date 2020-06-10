<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!DOCTYPE html>
<html lang="ko">
<head>
 <jsp:include page="../modal.jsp"/>
 </head>
 <body>
<c:choose>
	<c:when test="${email_chk == param.email}">
    	<% session.setAttribute("chk", "OK"); %>
    	
<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:olive'>회원가입 이메일 인증 성공</h5>
	      			<p class="left-align">이메일 인증이 되었습니다.<br></p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/User/join.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>
	</c:when>
<c:otherwise>
<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:red'>※접근 오류!</h5>
	      			<p class="left-align">잘못된 접근입니다.<br>회원가입 개인정보 동의로 넘어갑니다.</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/User/joinchk.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>
</c:otherwise>
</c:choose>
<script type="text/javascript" src="../JS/modal.js"></script>
</body>
</html>