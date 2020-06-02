<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<style>
	table {
		border: 1px solid #333;
	}
</style>

</head>
<body>
	<h1>List</h1>
	<table>
		<tr>
			<th></th>
			<th>uid</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty all || fn:length(all) == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="all" items="${all }">
				<tr>
					<td>${all.s_uid }</td>
					<td>${all.s_title }</td>
					<td><a href='view.ho?s_uid=${all.s_uid}'>${all.s_title}</a></td>
					<td>${listRow.m_nick}</td>
					<c:set var="now" value="<%= new java.util.Date() %>" />
					<fmt:parseDate var="s_date" value="${all.s_date }" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate var="now_date" value="${now}" pattern="yyyyMMdd"/>
					<fmt:formatDate var="this_date" value="${s_date}" pattern="yyyyMMdd"/>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<c:if test="${m_uid != null}">
		<button onclick="location.href='write.ho'">글쓰기</button>
	</c:if>
	<c:if test="${m_uid == null}">
		<button onclick="location.href='../Login/Login.ho'">로그인</button>
	</c:if>
</body>
</html>

