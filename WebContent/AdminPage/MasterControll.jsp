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
 <title>타이틀을 적어주세요</title>
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
				<li><a href="${pageContext.request.contextPath}/AdminPage/MasterControll.ho">관리페이지</a></li>
			<!-- 네비겡션 헤더 우측상단에 존재 메뉴 확장성 -->
			<table>
				<tbody>
					<tr>
						<th style="color: red"><h1>1taget</h1></th>
						<th>2taget</th>
					</tr>
				</tbody>
			</table>
			
				</c:when>
			<c:otherwise>
				<div style="font-size: 50px;" class="chenter-aline">잘못된 접근입니다.</div>
				<div style="font-size: 30px; height: 400px;" class="chenter-aline"><a href="${pageContext.request.contextPath}/index.ho">메인화면으로 바로가기</a></div>
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