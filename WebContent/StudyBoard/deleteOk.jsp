<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../modal.jsp" />
<c:if test="${result != 0}">
	<!-- <script>
		alert("삭제 성공.");
		location.href = "list.ho";
	</script> -->

	<div id="demo-modal" class="modal">
		<div class="modal-content">
			<h5>삭제 성공!!!!</h5>
		</div>
		<div class="modal-footer">
			<a href="list.ho" class="modal-close waves-effect waves-green btn-flat amber">Close</a>
		</div>
	</div>
</c:if>
<!-- <script>
		alert("삭제 실패!!!");
		history.back();
	</script> -->
<div id="demo-modal" class="modal">
	<div class="modal-content ">
		<h5>삭제 실패!!!</h5>
	</div>
	<div class="modal-footer">
		<a href="javascript:window.history.back();" class="modal-close waves-effect waves-green btn-flat amber">Close</a>

	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/modal.js"></script>