<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../top.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<title>마이페이지</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
	<%
		int menu = 1; // menu parameter 가 없으면 1 page 디폴트 동작
	String menu_param = request.getParameter("menu");
	if (menu_param != null) {
		try {
			menu = Integer.parseInt(menu_param);
		} catch (NumberFormatException e) {

		}
	}
	// 1 <= menu <= 3
	if (menu > 3)
		menu = 3;
	if (menu < 1)
		menu = 1;
	%>
	<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		
			<jsp:include page="left.jsp">
				<jsp:param value="<%=menu%>" name="menu" />
			</jsp:include>
			<%
				String articlepage = "article" + menu + ".jsp";
			%>
			<jsp:include page="<%=articlepage%>" />
		
	</div>
		<div class="col s1"></div>
	</div>
</section>
<jsp:include page="../foot.jsp"/>
</body>
</html>
