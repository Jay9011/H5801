<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../modal.jsp"/>
<c:choose>
	<c:when test="${refundOk == 1}">
	
		<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:red'>※결제 취소 성공</h5>
	      			<p class="left-align">"${total }원 (${item_name })이 결제 취소되었습니다. "</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/MyPage/book2.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>
	</c:when>
	
	<c:otherwise>
	
	
			<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:red'>※결제 취소 실패!</h5>
	      			<p class="left-align">결제 취소에 실패하셨습니다.</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/MyPage/book2.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="../JS/modal.js"></script>