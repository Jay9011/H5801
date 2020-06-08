<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
 <jsp:include page="../modal.jsp"/>

<c:choose>
	<c:when test="${update == 0 }">
		<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>수정 탈락!</h5>
      <p class="left-align">정보수정에 실패하였습니다.<br>다시시도해 주세요.</p>
    </div>
    <div class="modal-footer">
      <a href="javascript:window.history.back();" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
    </div>
  </div>
	</c:when>
	<c:otherwise>
		<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>수정 성공!</h5>
      <p class="left-align">정보수정에 통과!</p>
    </div>
    <div class="modal-footer">
      <a href="${pageContext.request.contextPath}/MyPage/reInfo.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
    </div>
  </div>
	</c:otherwise>
</c:choose> 
<script type="text/javascript" src="../JS/modal.js"></script>
</body>   
</html>