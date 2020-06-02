<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${login == 1 }">
		<script>
			alert("로그인 성공");
			location.href = "locationBook_test.holic";
		</script>
	</c:when>
	<c:otherwise>
				
		<script> 
			alert("로그인 실패");
			history.back();
		</script>
			
	</c:otherwise>
</c:choose>
