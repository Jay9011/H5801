<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-01  21:00 수정
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
 <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <jsp:include page="../modal.jsp"/>
 <c:choose>
	<c:when test="${send_result ==  1}">
	<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5 style='color:blue'>※인증번호 전송</h5>
      <p class="left-align">인증번호가 이메일로 전송되었습니다.</p>
    </div>
    <div class="modal-footer">
      <a href="${pageContext.request.contextPath}/User/resetPw.ho?uid=${send_arr[0].uid }" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
    </div>
  </div>
	</c:when>
	<c:otherwise>
	<div id="demo-modal" class="modal">
    	<div class="modal-content">
      		<h5 style='color:red'>※이메일 입력 오류!</h5>
      		<p class="left-align">존재하지 않는 이메일 입니다.</p>
		</div>
    	<div class="modal-footer">
      		<a href="javascript:window.history.back();" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
    	</div>
    </div>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="../JS/modal.js"></script>
</body>   
</html> 

