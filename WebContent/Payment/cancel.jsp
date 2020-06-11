<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script>
	window.history.forward();
	function blockBack(){window.history.forward();}
</script>
</head>
<body onload="blockBack()" onpageshow="if(event.persisted) blockBack();" onunload="">
	<jsp:include page="../modal.jsp" />
	<div id="demo-modal" class="modal">
		<div class="modal-content">
			<h5>결제를 취소하셨습니다.</h5>
			<p class="left-align">
				예약페이지로 돌아갑니다.
			</p>
		</div>
		<div class="modal-footer">
			<a href="${pageContext.request.contextPath}/Reservation/reservation.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
		</div>
	</div>
	<script type="text/javascript" src="../JS/modal.js"></script>
</body>
</html>