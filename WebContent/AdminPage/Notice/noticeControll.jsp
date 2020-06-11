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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/faq.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
 <title>Notice</title>
   </head>
   <body>
<jsp:include page="../../nav.jsp"/>
<jsp:include page="../../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		<!--  여기에다가 적어주기 (반응형은 필수이다. -->
		      <script type="text/javascript" src="js/materialize.min.js"></script>
		     
		      
		      
      <c:choose>
	<c:when test="${grade > 8 }">
      <div class="w-12 text_title FAQ pfont"><h1>공지사항<br>Admin Controll Page</h1></div>
  <div class="text_title left-1" style="width: 100%">
  
  
  
  

	<button class="btn waves-effect btn2 right-1" onclick="location.href = 'write.ho'">추가</button>


  </div>
  
  <br>
  <div>
  <div class="clear"></div>
    <div class="hr"><hr class="hr2"></div>


<br>
<div class="FAQ">
  	<table id="postList">
        <!-- <카테고리> - <수정/삭제 버튼> - <타이틀> - <아이콘?> - <10개당 1페이지> -->
          <tr class="header">
          <td class="w-8 left-1">Title</td>
          <td class="w-2 left-1 firstSet-1">View Count</td>
          <td class="w-2 left-1 firstSet-1">Creation time</td>
          </tr>
	    <c:choose>
    	<c:when test="${empty npagetable || fn:length(npagetable) == 0 }"></c:when>
    	<c:otherwise>
    		<c:forEach var="notice" items="${npagetable }">
        <tr class="menu s10 " id="postList ">
          <td class="w-8 left-1 s4 firstSet-3 " id="postList "><a class="firstSet-3" href="noticeview.ho?uid=${notice.n_uid}">UID : ${notice.n_uid }&nbsp;&nbsp;Title : ${notice.n_title }</a></td>
          <td class="w-2 left-1 s4 firstSet-1">${notice.n_viewCnt }</td>
          <td class="w-2 left-1 s4 right-align firstSet-2">${notice.n_date }</td>
          <td class="clear">
        </tr>
           </c:forEach>
    	</c:otherwise>
    </c:choose>
        </table>
      <br><br><br>
      <div class="hr"><hr class="hr2"></div>
      
      <!-- ===========================================페이징============================================= -->
	<div class="pager center-align">
    <ul class="pagination">
        <c:if test="${ curPageNum > 5 && !empty kwd }">
            <li><a href="notice.ho?page=${ blockStartNum - 1 }&kwd=${ kwd }"><i class='material-icons'>chevron_left</i></a></li>
        </c:if>
        
        <c:if test="${ curPageNum > 5 }">
            <li><a href="notice.ho?page=${ blockStartNum - 1 }"><i class='material-icons'>chevron_left</i></a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
            <c:choose>
                <c:when test="${ i > lastPageNum }">
                    <li><a>${ i }</a></li>
                </c:when>
                <c:when test="${ i == curPageNum }">
                    <li class="active"><a>${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="notice.ho?page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${ lastPageNum > blockLastNum }">
            <li><a href="notice.ho?page=${ blockLastNum + 1 }"><i class='material-icons'>chevron_right</i></a></li>
        </c:if>
    </ul>
</div> 
      </div>
      <!--  -->
  </div>  <!-- END -->
		
		

		</c:when>
	<c:otherwise>
	<div style="font-size: 50px;" class="chenter-aline">잘못된 접근입니다.</div>
<div style="font-size: 30px; height: 400px;" class="chenter-aline"><a href="${pageContext.request.contextPath}/Notice/notice.ho">Notice/공지사항 바로가기</a></div>
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































