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
    	<c:when test="${empty npagetable || fn:length(npagetable) == 0 }"></c:when>
    	<c:otherwise>
    		<c:forEach var="notice" items="${npagetable }">
        <div class="menu">
          <div class="w-1 left-1">${notice.n_uid }</div>
          <div class="w-7 left-1"><a class="acol" href="${pageContext.request.contextPath}/Notice/noticeview.ho?uid=${notice.n_uid}">${notice.n_title }</a></div>
          <div class="w-2 left-1">${notice.n_viewCnt }</div>
          <div class="w-2 left-1">${notice.n_date }</div>
          <div class="clear"></div>
        </div>
           </c:forEach>
    	</c:otherwise>
    </c:choose>
        </div>
      <br><br><br>
      
      <!--  -->
      
      <div class="pager">
    <ul>
        <c:if test="${ curPageNum > 5 && !empty kwd }">
            <li><a href="noticeControll.ho?page=${ blockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
        </c:if>
        
        <c:if test="${ curPageNum > 5 }">
            <li><a href="noticeControll.ho?page=${ blockStartNum - 1 }">◀</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
            <c:choose>
                <c:when test="${ i > lastPageNum }">
                    <li>${ i }</li>
                </c:when>
                <c:when test="${ i == curPageNum }">
                    <li class="selected">${ i }</li>
                </c:when>
                <c:when test="${ !empty kwd}">
                    <li><a href="noticeControll.ho?page=${ i }&kwd=${ kwd }">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="noticeControll.ho?page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${ lastPageNum > blockLastNum && !empty kwd }">
            <li><a href="noticeControll.ho?page=${ blockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
        </c:if>
        
        <c:if test="${ lastPageNum > blockLastNum }">
            <li><a href="noticeControll.ho?page=${ blockLastNum + 1 }">▶</a></li>
        </c:if>
    </ul>
</div> 
      
      <!--  -->
  </div>  <!-- END -->
		
		
		
		
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>