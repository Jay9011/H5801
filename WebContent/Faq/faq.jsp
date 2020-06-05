<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
    <link rel="stylesheet" href="../CSS/index.css">
    <link rel="stylesheet" href="../CSS/faq.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="../JS/faq.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title>Holic-FAQ</title>
      
      
      
    </head>
    <body>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      <div class="w-12 text_title FAQ"><h1>Introdus Holic Reading Room</h1></div>
  <div class="text_title"><span class="ButtomBtn1 colorsel" id="FAQBTN">FAQ</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="ButtomBtn2 colorsel" id="GONGBTN">Gong</span></div>
  <br>
  <div>
    <div class="hr"><hr class="hr2"></div>
      <div class="FAQ">
<!-- https://material.io/resources/icons/?style=baseline -->

    <div class="ac">
    <ul class="collapsible">
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
<div><h5>If you have more questions, click the button to go</h5></div>
<br>
<div class="bt-1"><a class="waves-effect waves-light btn bt-2">Ask a question</a></div>
</div>


</body>
</html>

