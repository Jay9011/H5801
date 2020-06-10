

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../modal.jsp"/>
<c:choose>
	<c:when test="${successUrl != null}">
	<!DOCTYPE html>
		<html lang="ko">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<head>
		<meta charset="UTF-8">
		<title>pay</title>
		</head>

		<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:blue'>※결제 페이지 이동</h5>
	      			<p class="left-align">결제 페이지 이동합니다.</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${successUrl }" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>
		
		<body>
		<form name="frm" action="approval.payment" method="post">
			<input type="hidden" name="pg_token" value="${param.pg_token }"/> <!-- parameter 넘길 때 자주 사용 -->
		</form>
		</body>
		</html>
	
	
	</c:when>
	
	
	<c:otherwise>
				
		<div id="demo-modal" class="modal">
	    	<div class="modal-content">
	      		<h5 style='color:red'>※접근 오류!</h5>
	      			<p class="left-align">잘못된 접근입니다. 로그인해주세요.</p>
			</div>
	    	<div class="modal-footer">
	      		<a href="${pageContext.request.contextPath}/User/login.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
	    	</div>
    	</div>
			
	</c:otherwise>
	
</c:choose>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/modal.js"></script>