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

	<div class="pager">
    <ul>
        <c:if test="${ curPageNum > 5 && !empty kwd }">
            <li><a href="${pageContext.request.contextPath}/MyPage/book.ho?menu=1&page=${ blockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
        </c:if>
        
        <c:if test="${ curPageNum > 5 }">
            <li><a href="${pageContext.request.contextPath}/MyPage/book.ho?menu=1&page=${ blockStartNum - 1 }">◀</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
            <c:choose>
                <c:when test="${ i > lastPageNum }">
                    <li>${ i }</li>
                </c:when>
                <c:when test="${ i == curPageNum }">
                    <li class="selected">${ i }</li>
                </c:when>
                <c:when test="${ !empty kwd}">
                    <li><a href="${pageContext.request.contextPath}/MyPage/book.ho?menu=1&a=search&page=${ i }&kwd=${ kwd }">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/MyPage/book.ho?menu=1&page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        
        
        <c:if test="${ lastPageNum > blockLastNum && !empty kwd }">
            <li><a href="${pageContext.request.contextPath}/MyPage/book.ho?menu=1&a=search&page=${ blockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
        </c:if>
        
        <c:if test="${ lastPageNum > blockLastNum }">
            <li><a href="${pageContext.request.contextPath}/MyPage/book.ho?menu=1&page=${ blockLastNum + 1 }">▶</a></li>
        </c:if>
    </ul>
</div> 
	
</body>
</html>

