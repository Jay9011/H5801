<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 1 }">
이메일 : ${m_email }<br>
닉네임 : ${m_nick }<br>
등급 : ${m_grade }
</c:if>
<c:if test="${result == 0 }">
아이디가 없습니다.
</c:if>
<br>
<a href="../StudyBoard/list.ho">학습목록 리스트로 이동</a>
</body>
</html>