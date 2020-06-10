<%-- 수빈  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <jsp:include page="../modal.jsp"/>
<c:choose>
	<c:when test="${emailcnt == 1 }">
	<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>회원가입 인증 이메일 전송</h5>
      <p class="left-align">이메일 주소 인증 메일이 전송되었습니다.<br>이메일에 들어가셔서 인증해주세요.<br>이메일 인증을 통해서만 가입됩니다.</p>
    </div>
    <div class="modal-footer">
      <a href="${pageContext.request.contextPath}/index.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
    </div>
  </div>
	</c:when>
		<c:otherwise>
	<div id="demo-modal" class="modal">
    	<div class="modal-content">
      		<h5>회원가입 이메일 인증 실패</h5>
      		<p class="left-align">이미 존재 하는 이메일 입니다.<br>다른 이메일로 시도해 주세요</p>
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