<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
<c:when test="${chk == -1 || chk == 0}">
<script>
alert("아이디 혹은 패스워드가 틀렸습니다.");
history.back(); 
		</script>
	</c:when>
	<c:when test="${chk == 1 }">
	<script>
	<% response.sendRedirect("index.ho");%>
	</script>
	</c:when>
</c:choose>
