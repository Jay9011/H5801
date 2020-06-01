<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	table {
		border: 1px solid #333;
	}
</style>
</head>
<body>
	<h1>List</h1>
	현재 로그인중인 유저 : ${m_nick }<br>
	<table>
		<tr>
			<th></th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty listRow || fn:length(listRow) == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="listRow" items="${listRow }">
				<tr>
					<td>${listRow.s_uid }</td>
					<td>${listRow.sc_name }</td>
					<td><a href='view.ho?s_uid=${listRow.s_uid}'>${listRow.s_title}</a></td>
					<td>${listRow.m_nick}</td>
					<c:set var="now" value="<%= new java.util.Date() %>" />
					<fmt:parseDate var="s_date" value="${listRow.s_date }" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate var="now_date" value="${now}" pattern="yyyyMMdd"/>
					<fmt:formatDate var="this_date" value="${s_date}" pattern="yyyyMMdd"/>
					<c:choose>
						<c:when test="${now_date - this_date == 0}">
							<td>${listRow.s_date_time }</td>
						</c:when>
						<c:otherwise>
							<td>${listRow.s_date_day }</td>
						</c:otherwise>
					</c:choose>
					<td>${listRow.s_viewCnt }</td>
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