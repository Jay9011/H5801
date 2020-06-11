<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../top.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<title>댓글 단 게시글</title>
</head>
<body>
<h3 class="center-align pfont">댓글 단 게시글</h3>
	<table id="postList" class="highlight">
	<thead>
		<tr>
			<th width="100px">NO</th>
                <th>제목</th>
                <th width="150px">작성일</th>		
		</tr>
	</thead>
		<c:choose>
			<c:when test="${empty comment || fn:length(comment) == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="comment" items="${comment }" varStatus="status">
				<tr>
					<td>${comment.s_uid }</td>
					<td><a href='${pageContext.request.contextPath}/StudyBoard/view.ho?s_uid=${comment.s_uid}'>${comment.s_title }</a></td>
					<td id="tdd${status.index }">
						<script>
						if ((Math
								.ceil((new Date() - new Date('${comment.s_date}'))
										/ (1000 * 3600 * 24)) - 1) == 0) {
							$("#tdd${status.index}").html('${comment.s_date_time}');
						} else {
							$("#tdd${status.index}").html('${comment.s_date_day}');
						}
						</script>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pager center-align">
    <ul class="pagination">
        <c:if test="${ curPageNum > 5 && !empty kwd }">
            <li><a href="list.ho?menu=1&page=${ blockStartNum - 1 }&kwd=${ kwd }"><i class='material-icons'>chevron_left</i></a></li>
        </c:if>
        
        <c:if test="${ curPageNum > 5 }">
            <li><a href="list.ho?menu=1&page=${ blockStartNum - 1 }"><i class='material-icons'>chevron_left</i></a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
            <c:choose>
                <c:when test="${ i > lastPageNum }">
                    <li><a class='disabled'>${ i }</a></li>
                </c:when>
                <c:when test="${ i == curPageNum }">
                    <li class="active"><a>${ i }</a></li>
                </c:when>
                <c:when test="${ !empty kwd}">
                    <li><a href="list.ho?menu=2&a=search&page=${ i }&kwd=${ kwd }">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="list.ho?menu=2&page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${ lastPageNum > blockLastNum && !empty kwd }">
            <li><a href="list.ho?menu=2&a=search&page=${ blockLastNum + 1 }&kwd=${ kwd }"><i class='material-icons'>chevron_right</i></a></li>
        </c:if>
        
        <c:if test="${ lastPageNum > blockLastNum }">
            <li><a href="list.ho?menu=2&page=${ blockLastNum + 1 }"><i class='material-icons'>chevron_right</i></a></li>
        </c:if>
    </ul>
</div> 
</body>
</html>

