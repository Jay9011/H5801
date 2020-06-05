<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/faq.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
      <script src="JS/faq.js"></script>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title>Holic-FAQ</title>
      
      
      
    </head>
    <body>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <div class="w-12 text_title FAQ"><h1>22Introdus Holic Reading Room</h1></div>
  <div class="text_title"><span class="ButtomBtn1 colorsel" id="FAQBTN">FAQ</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="ButtomBtn2 colorsel" id="GONGBTN">Gong</span></div>
  <br>
  <div>
    <div class="hr"><hr class="hr2"></div>


<br>
<div class="FAQ">
  <div class="ac">
        <!-- <카테고리> - <수정/삭제 버튼> - <타이틀> - <아이콘?> - <10개당 1페이지> -->
          <div class="header">
          <div class="w-1 left-1">Number</div>
          <div class="w-7 left-1">Title</div>
          <div class="w-2 left-1">View Count</div>
          <div class="w-2 left-1">Creation time</div>
          </div>
          <br>
          <div class="w-12"><hr class="hr1"></div>
	    <c:choose>
    	<c:when test="${empty nListRow || fn:length(nListRow) == 0 }"></c:when>
    	<c:otherwise>
    		<c:forEach var="notice" items="${nListRow }">
        <div class="menu">
          <div class="w-1 left-1">${notice.n_uid }</div>
          <div class="w-7 left-1"><a class="acol" href="noticeview.fc3?uid=${notice.n_uid}">${notice.n_title }</a></div>
          <div class="w-2 left-1">${notice.n_viewCnt }</div>
          <div class="w-2 left-1">${notice.n_date }</div>
          <div class="clear"></div>
        </div>
           </c:forEach>
    	</c:otherwise>
    </c:choose>
        </div>
      <br><br><br>
  </div>  <!-- END -->
</div>


<div class="hr"><hr class="hr2"></div>
<div><h5>If you have more questions, click the button to go</h5></div>
<br>
<div class="bt-1"><a class="waves-effect waves-light btn bt-2">Ask a question</a></div>


</body>
</html>

