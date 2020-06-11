<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/comment.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/faq.css">
 <title>자주하는 질문</title>
   </head>
   <body>
<jsp:include page="../../nav.jsp"/>
<jsp:include page="../../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
            
    <c:choose>
	<c:when test="${grade > 8 }">
      <div class="col s12 text_title FAQ pfont"><h2>자주하는 질문 <br>Admin Controll Page</h2></div>
      <div class="col s10"></div>
	<button class="s2 btn waves-effect btn2 right-align" onclick="location.href='write.ho'">추가</button>


  <div>

      <div class="FAQ">

    <div>
      <ul class="collapsible popout s12">
    <c:choose>
    	<c:when test="${empty listRow || fn:length(listRow) == 0 }"></c:when>
    	<c:otherwise>
    		<c:forEach var="faq" items="${listRow }">
    	<li>
      		<div class="collapsible-header s12"><i class="material-icons">live_help</i>UID : ${faq.f_uid }&nbsp;&nbsp;Title : ${faq.f_title }</div>
      		<div class="collapsible-body s12" id="test"><span>Content : <br>${faq.f_content }</span>
      		<div class="right-align">
      		<button class="btn waves-effect btn2" onclick="location.href='update.ho?f_uid=${faq.f_uid }'">수정</button>
			<button class="btn waves-effect btn2" onclick="location.href='deleteOk.ho?f_uid=${faq.f_uid }'">삭제</button>
			</div>
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
	
	</c:when>
<c:otherwise>
<div style="font-size: 50px;" class="chenter-aline">잘못된 접근입니다.</div>
<div style="font-size: 30px; height: 400px;" class="chenter-aline"><a href="${pageContext.request.contextPath}/Faq/faq.ho">FAQ/자주하는질문 바로가기</a></div>
</c:otherwise>
	</c:choose>	
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../../foot.jsp"/>
<!--  js 추가는 여기에 -->
<script src="${pageContext.request.contextPath}/JS/faq.js"></script>
</body>
</html>
