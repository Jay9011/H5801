<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
 <title>PageControll</title>
   </head>
   <body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		<!--  여기에다가 적어주기 (반응형은 필수이다. -->
		
		
<c:choose>
	<c:when test="${grade > 8 }">
	
	
	
	
	
	
	
	
	
	
	</c:when>
	<c:otherwise>
		<div style="font-size: 50px;" class="chenter-aline">잘못된 접근입니다.</div>
	</c:otherwise>
</c:choose>		
		
		
		
		
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>