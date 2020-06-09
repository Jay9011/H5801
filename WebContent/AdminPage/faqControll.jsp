<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
 <title>타이틀 써주기</title>
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
		
	  <div class="text_title left-1">
	  <span class="ButtomBtn1 colorsel"><a href="${pageContext.request.contextPath}/Faq/write.ho">추가</a></span>&nbsp;&nbsp;|&nbsp;&nbsp;
	  <span class="ButtomBtn2 colorsel"><a href="${pageContext.request.contextPath}/Faq/update.ho">수정</a></span>&nbsp;&nbsp;|&nbsp;&nbsp;
	  <span class="ButtomBtn2 colorsel"><a href="${pageContext.request.contextPath}/Faq/deleteOk.ho">삭제</a></span>
	  </div>
    <div class="hr"><hr class="hr2"></div>
    <div class="ac">
    <ul class="collapsible">
    <c:choose>
    	<c:when test="${empty listRow || fn:length(listRow) == 0 }"></c:when>
    	<c:otherwise>
    		<c:forEach var="faq" items="${listRow }">
    	<li>
      		<div class="collapsible-header"><i class="material-icons">live_help</i>UID : ${faq.f_uid } &nbsp; ${faq.f_title }</div>
      		<div class="collapsible-body" id="test"><span>${faq.f_content }</span></div>
    	</li>
    		</c:forEach>
    	</c:otherwise>
    </c:choose>
    
    
  </ul>
</div><!-- end -->
		
		
		
		

  
  
  
  
  
		
		
		
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>