<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <jsp:include page="../modal.jsp"/>
<c:choose>
	<c:when test="${result == 0}">
		<!-- <script>
			alert("수정 실패!!!");
			history.back();
		</script> -->
		<div id="demo-modal" class="modal">
    <div class="modal-content ">
      <h5>수정 실패!!!</h5>
      <!-- <p class="left-align">HOLIC 스터디 카페에 가입해주셔서 감사합니다.</p> -->
    </div>
    <div class="modal-footer">
      <a href="javascript:window.history.back();" class="modal-close waves-effect waves-green btn-flat amber">Close</a>
      
    </div>
  </div>
	</c:when>
	<c:otherwise>
		<!-- <script>
			alert("수정 성공.");
			location.href = 'view.ho?s_uid=${param.s_uid}';
		</script> -->
		<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>수정 성공!!!!</h5>
      <!-- <p class="left-align">회원 가입에 실패하였습니다.<br>회원가입을 다시시도해 주세요.</p> --> 
    </div>
    <div class="modal-footer">
      <a href="${pageContext.request.contextPath}/StudyBoard/view.ho?s_uid=${param.s_uid}" class="modal-close waves-effect waves-green btn-flat amber">Close</a>
    </div>
  </div>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/modal.js"></script>
</body>   
</html>