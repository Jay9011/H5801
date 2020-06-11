<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<jsp:include page="../modal.jsp"/>
<c:choose>
	<c:when test="${result == 0}">
		<!-- <script>
			alert("등록 실패!!!");
			history.back();		// 브라우저가 기억하는 직전 페이지로 이동
		</script> -->
		<div id="demo-modal" class="modal">
			<div class="modal-content ">
				<h5>글 등록 실패!!!</h5>
			</div>
			<div class="modal-footer">
				<a href="javascript:window.history.back();" class="modal-close waves-effect waves-green btn-flat amber">Close</a>

			</div>
		</div>
	</c:when>
	<c:otherwise>
		<!-- <script>
			alert("등록 성공, 리스트를 출력합니다.");
			location.href = "list.ho";
		</script> -->
		<div id="demo-modal" class="modal">
			<div class="modal-content">
				<h5>글 등록 성공!!!!</h5>
			</div>
			<div class="modal-footer">
				<a href="list.ho" class="modal-close waves-effect waves-green btn-flat amber">Close</a>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/modal.js"></script>