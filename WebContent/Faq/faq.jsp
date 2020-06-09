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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/comment.css">
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
      
      
    <div class="col m7 offset-m5 s12  right-align" style="margin-bottom:51px; ">
      <ul class="tabs">
        <li class="tab col s6 m6">
          <a target="_self" class="" href="${pageContext.request.contextPath}/Notice/notice.ho">공지사항</a>
        </li>
        <li class="tab col s6 m6">
          <a target="_self" class="" href="${pageContext.request.contextPath}/Faq/faq.ho">FAQ</a>
        </li>
      <li class="indicator" style="left: 0px; right: 284px;"></li></ul>
    </div>
      
      
      <div class="w-12 text_title FAQ pfont"><h1>자주하는 질문</h1></div>
  <div class="text_title left-1" style="width: 100%">
    <c:choose>
	<c:when test="${grade > 8 }">
	<button class="btn waves-effect btn2 right-1" onclick="location.href = 'write.ho'">추가</button>
	</c:when>
	</c:choose>	

  </div>
  
  
  <br>
  <div>
  <div class="clear"></div>
    <div class="hr"><hr class="hr2"></div>
      <div class="FAQ">

    <div>
      <ul class="collapsible popout s12">
    <c:choose>
    	<c:when test="${empty listRow || fn:length(listRow) == 0 }"></c:when>
    	<c:otherwise>
    		<c:forEach var="faq" items="${listRow }">
    	<li>
      		<div class="collapsible-header s12"><i class="material-icons">live_help</i>${faq.f_title }</div>
      		<div class="collapsible-body s12" id="test"><span>${faq.f_content }</span>
      		 <c:choose>
				<c:when test="${grade > 8 }">
					<button class="btn waves-effect btn2 right-1" onclick="location.href = 'update.ho?f_uid=${faq.f_uid }'">수정</button>
					<button class="btn waves-effect btn2 right-1" onclick="location.href = 'deleteOk.ho?f_uid=${faq.f_uid }'">삭제</button>
				</c:when>
			</c:choose>	
      		</div>
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
<div class="div1"><h5>여러분들의 공부를 항상 응원합니다.</h5></div>

		
		
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
<script src="../JS/faq.js"></script>
</body>
</html>