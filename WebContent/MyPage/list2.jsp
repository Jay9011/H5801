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
	/* table {
		border: 1px solid #333;
	} */
	tr, th, td{
		border-bottom : 1px solid #666;
	}
</style>
</head>
<body>
<h1>List</h1>
	<table>
		<tr>
			<th>uid</th>
			<th>제목/내용</th>
			<th>작성일</th>			
		</tr>
		<c:choose>
			<c:when test="${empty all || fn:length(all) == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="all" items="${all }">
				<tr>
					<td>${all.s_uid }</td>
					<td><a href='view.ho?s_uid=${all.s_uid}'><h2>${all.s_title}</h2><p>${all.s_content }</p></a></td>
					<td>${all.s_date }</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pager">
    <ul>
        <c:if test="${ curPageNum > 5 && !empty kwd }">
            <li><a href="list.ho?page=${ blockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
        </c:if>
        
        <c:if test="${ curPageNum > 5 }">
            <li><a href="list.ho?page=${ blockStartNum - 1 }">◀</a></li>
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
                    <li><a href="list.ho?a=search&page=${ i }&kwd=${ kwd }">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="list.ho?page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${ lastPageNum > blockLastNum && !empty kwd }">
            <li><a href="list.ho?a=search&page=${ blockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
        </c:if>
        
        <c:if test="${ lastPageNum > blockLastNum }">
            <li><a href="list.ho?page=${ blockLastNum + 1 }">▶</a></li>
        </c:if>
    </ul>
</div> 
	<br>
	<table>
		<tr>
			<th>uid</th>
			<th>제목/내용</th>
			<th>작성일</th>			
		</tr>
		<c:choose>
			<c:when test="${empty comment || fn:length(comment) == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="comment" items="${comment }">
				<tr>
					<td>${comment.s_uid }</td>
					<td><a href='view.ho?s_uid=${comment.s_uid}'><h2>${comment.s_title}</h2><p>${comment.s_content }</p></a></td>
					<td>${comment.s_date }</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="pager">
    <ul>
        <c:if test="${ acurPageNum > 5 && !empty kwd }">
            <li><a href="list.ho?page=${ ablockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
        </c:if>
        
        <c:if test="${ acurPageNum > 5 }">
            <li><a href="list.ho?page=${ ablockStartNum - 1 }">◀</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ ablockStartNum }" end="${ ablockLastNum }">
            <c:choose>
                <c:when test="${ i > alastPageNum }">
                    <li>${ i }</li>
                </c:when>
                <c:when test="${ i == acurPageNum }">
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
        
        <c:if test="${ alastPageNum > ablockLastNum && !empty kwd }">
            <li><a href="list.ho?a=search&page=${ ablockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
        </c:if>
        
        <c:if test="${ alastPageNum > ablockLastNum }">
            <li><a href="list.ho?page=${ ablockLastNum + 1 }">▶</a></li>
        </c:if>
    </ul>
</div> 
	<br>
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
	<%
	int menu = 1;  // menu parameter 가 없으면 1 page 디폴트 동작
	String menu_param = request.getParameter("menu");
	if(menu_param != null){  
		try{
			menu = Integer.parseInt(menu_param);
		}catch(NumberFormatException e){
			
		}
	}
	// 1 <= menu <= 3
	if(menu > 3) menu = 3;
	if(menu < 1) menu = 1;
%>
	<div class="container" style="margin-top:30px">
	<div class="row">
	<jsp:include page="left.jsp">
		<jsp:param value="<%= menu %>" name="menu"/>
	</jsp:include>
	<% String articlepage = "article" + menu + ".jsp"; %>
	<jsp:include page="<%=articlepage %>"/>
	</div>
</div>
</body>
</html>

