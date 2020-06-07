

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:choose>
	<c:when test="${successUrl != null}">
	<!DOCTYPE html>
		<html lang="ko">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<head>
		<meta charset="UTF-8">
		<title>pay</title>
		</head>
		<script> 
			alert("결제 페이지 이동");
			location.href = "${successUrl }";
		</script>
		<body>
		<form name="frm" action="approval.payment" method="post">
			<input type="hidden" name="pg_token" value="${param.pg_token }"/> <!-- parameter 넘길 때 자주 사용 -->
		</form>
		</body>
		</html>
	
	
	</c:when>
	
	
	<c:otherwise>
				
		<script> 
			alert("잘못된 접근입니다.");
			history.back();
		</script>
			
	</c:otherwise>
	
</c:choose>