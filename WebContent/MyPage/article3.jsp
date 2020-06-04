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
</head>
<body>
<table>
		<tr>
			<th>uid</th>
			<th>제목/내용</th>
			<th>작성일</th>			
		</tr>
		<c:choose>
			<c:when test="${empty like || fn:length(like) == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="like" items="${like }">
				<tr>
					<td>${like.s_uid }</td>
					<td><a href='view.ho?s_uid=${like.s_uid}'><h2>${like.s_title}</h2><p>${like.s_content }</p></a></td>
					<td>${like.s_date }</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pager">
    <ul>
        <c:if test="${ bcurPageNum > 5 && !empty kwd }">
            <li><a href="list.ho?page=${ bblockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
        </c:if>
        
        <c:if test="${ bcurPageNum > 5 }">
            <li><a href="list.ho?page=${ bblockStartNum - 1 }">◀</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ bblockStartNum }" end="${ bblockLastNum }">
            <c:choose>
                <c:when test="${ i > blastPageNum }">
                    <li>${ i }</li>
                </c:when>
                <c:when test="${ i == bcurPageNum }">
                    <li class="selected">${ i }</li>
                </c:when>
                <c:when test="${ !empty kwd}">
                    <li><a href="list.ho?a=search&page=${ i }&kwd=${ kwd }">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="list.ho?page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${ blastPageNum > bblockLastNum && !empty kwd }">
            <li><a href="list.ho?a=search&page=${ bblockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
        </c:if>
        
        <c:if test="${ blastPageNum > bblockLastNum }">
            <li><a href="list.ho?page=${ bblockLastNum + 1 }">▶</a></li>
        </c:if>
    </ul>
</div>
<c:if test="${m_uid != null}">
		<button onclick="location.href='write.ho'">글쓰기</button>
	</c:if>
	<c:if test="${m_uid == null}">
		<button onclick="location.href='../Login/Login.ho'">로그인</button>
	</c:if>
</body>
</html>

