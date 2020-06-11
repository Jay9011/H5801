<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

 <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <jsp:include page="../modal.jsp"/>
	
	<div id="select-modal" class="modal">
		<div class="modal-content select-modal">
			<h5 style='color:red'>※선택 오류!</h5>
				<p class="left-align">결제 취소할 항목을 선택해주세요.</p>
		</div>
		<div class="modal-footer">
			<a href="${pageContext.request.contextPath}/MyPage/book2.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
		</div>
	</div>
<script type="text/javascript" src="../JS/modal.js"></script>