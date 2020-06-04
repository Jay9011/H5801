<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${cnt == 1}">
	<script>
			alert("회원가입에 성공하셨습니다.");
			location.href = "index.ho";
		</script>
</c:when>
<c:otherwise>
		<script>
			alert("회원가입에 실패 했습니다. 회원가입을 다시시도해 주세요");
			history.back(); 
		</script>
	</c:otherwise>
</c:choose>