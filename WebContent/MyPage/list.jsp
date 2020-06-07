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
	<%-- <%
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
%> --%>
	<div class="container" style="margin-top:30px">
	<div class="row">
	<%-- <jsp:include page="left.jsp">
		<jsp:param value="<%= menu %>" name="menu"/>
	</jsp:include>
	<% String articlepage = "article" + menu + ".jsp"; %>
	<jsp:include page="<%=articlepage %>"/> --%>
	<c:choose>
		<c:when test="${empty menu == true}"></c:when>
		<c:otherwise>
			<c:forEach var="menu" items="${menu.menu }">
			<c:import url="article${menu.menu } + .jsp"/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
</div>
</body>
</html>





<%-- <c:choose>
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
		</c:choose> --%>

















