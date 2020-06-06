<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-01  21:00 수정
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:choose>
	
	<c:when test="${send_result ==  1}">
	
		<script> 
			alert("인증번호가 이메일로 전송되었습니다.");
			location.href = "${pageContext.request.contextPath}/User/resetPw.ho?uid=${send_arr[0].uid }";
		</script>
	
	</c:when>
	
	<c:otherwise>
		
		<script> 
			alert("존재하지 않는 이메일 입니다. 다시 한번 시도해 주세요.");
			history.back();
		</script>
	
	</c:otherwise>
	
	
</c:choose>
