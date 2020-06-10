<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
 <jsp:include page="../modal.jsp"/>
<c:choose>
<c:when test="${cnt == 1}">
<div id="demo-modal" class="modal">
    <div class="modal-content ">
      <h5>회원가입 성공</h5>
      <p class="left-align">HOLIC 스터디 카페에 가입해주셔서 감사합니다.</p>
    </div>
    <div class="modal-footer">
      <a href="${pageContext.request.contextPath}/index.ho" class="modal-close waves-effect waves-green btn-flat amber">Close</a>
    </div>
  </div>
</c:when>
<c:otherwise>
<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>회원가입 실패</h5>
      <p class="left-align">회원 가입에 실패하였습니다.<br>회원가입을 다시시도해 주세요.</p>
    </div>
    <div class="modal-footer">
      <a href="javascript:window.history.back();" class="modal-close waves-effect waves-green btn-flat amber">Close</a>
    </div>
  </div>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/modal.js"></script>
</body>   
</html>