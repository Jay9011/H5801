<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test="${refundOk == 1}">
	
		<script>
			alert("${total }원 (${item_name })이 결제 취소되었습니다. ");
			location.href = "${pageContext.request.contextPath}/MyPage/book.ho";
		</script>	
		
	</c:when>
	
	<c:otherwise>
	
		<script>
			alert("결제에 실패하셨습니다.");
			location.href = "${pageContext.request.contextPath}/MyPage/book.ho";
		</script>
	
	</c:otherwise>
</c:choose>
