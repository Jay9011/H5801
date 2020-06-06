<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
 <jsp:include page="../modal.jsp"/>
<%-- <c:choose>
<c:when test="${cnt == 1}"> --%>
<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>제목써주기</h5>
      <p class="left-align">내용써주기</p>
    </div>
    <div class="modal-footer">
      <a href="${pageContext.request.contextPath}/index.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
    </div>
  </div>
<%-- </c:when>
<c:otherwise>  두개일시 이렇게 써주면됩니다 --%>
<div id="demo-modal" class="modal">
    <div class="modal-content">
      <h5>회원가입 실패</h5>
      <p class="left-align">회원 가입에 실패하였습니다.<br>회원가입을 다시시도해 주세요.</p>
    </div>
    <div class="modal-footer">
      <a href="javascript:window.history.back();" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
    </div>
  </div>
<%-- 	</c:otherwise>
</c:choose> --%>
<script type="text/javascript" src="../JS/modal.js"></script>
</body>   
</html>