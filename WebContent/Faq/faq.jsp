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
   <link rel="stylesheet" href="../CSS/faq.css">
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
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <div class="w-12 text_title FAQ"><h1>Introdus Holic Reading Room</h1></div>
  <div class="text_title left-1">
  <span class="ButtomBtn2 colorsel" id="GONGBTN"><a href="${pageContext.request.contextPath}/Notice/notice.ho">Notice</a></span>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <span class="ButtomBtn1 colorsel" id="FAQBTN"><a href="${pageContext.request.contextPath}/Faq/faq.ho">FAQ</a></span>
  </div>
  
  <br>
  <div>
  <div class="clear"></div>
    <div class="hr"><hr class="hr2"></div>
      <div class="FAQ">

    <div class="ac">
      <ul class="collapsible popout">
    <c:choose>
    	<c:when test="${empty listRow || fn:length(listRow) == 0 }"></c:when>
    	<c:otherwise>
    		<c:forEach var="faq" items="${listRow }">
    	<li>
      		<div class="collapsible-header"><i class="material-icons">live_help</i>${faq.f_title }</div>
      		<div class="collapsible-body" id="test"><span>${faq.f_content }</span></div>
    	</li>
    		</c:forEach>
    	</c:otherwise>
    </c:choose>
    
    
  </ul>
</div>
<br><br><br>
</div>  <!-- END -->
</div>  <!-- END -->

<br>
<div class="hr"><hr class="hr2"></div>
<div class="div1"><h5>If you have more questions, click the button to go</h5></div>
<br>
<div class="bt-1 div1"><a class="waves-effect waves-light btn bt-2" href="${pageContext.request.contextPath}/StudyBoard/list.ho">Ask a question</a></div>
		
		
		
		
		
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
<script src="../JS/faq.js"></script>
</body>
</html>