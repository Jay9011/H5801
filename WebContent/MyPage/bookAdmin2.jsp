<%-- 예약현황 --%>
<%-- 
  작성자: 낙경
 2020-06-11  00:00 수정
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<jsp:include page="../modal.jsp"/>

<c:choose>

<c:when test="${uid != null && grade > 8 }">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/CSS/book.css"/>
<script src="${pageContext.request.contextPath }/JS/bookAdmin2.js"></script>
<title>MY RESERVATION</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	<div class="row">
	<div class="col s1 "></div>
	<div class="col s10">

		<h3 class="center-align pfont">고객 예약현황</h3>
		<div style="padding: 30px;"></div>
		
		<c:if test="${empty list || fn:length(list) == 0}">
			<p style="text-align: center">예약된 내용이 없습니다.</p>
		</c:if>
		
		<c:if test="${!empty list && fn:length(list) != 0}">
<div id = "list">
			<div>
				<div id="pageinfo"></div>
			</div>
			<div class="clear"></div>

		<div class="table-container">
		<table class="highlight centered" id="table">

		<thead style="border-top: 1px solid grey">
			<tr>
				<th>NO</th>
				<%--<th>결재번호</th>--%>
				<th>예약내용</th>
				<th>예약일자</th>
				<%--<th>예약시간</th>--%>
				<th>결제총액</th>
				<th>결제현황</th>
				<th>회원이름</th>
				<%--<th>항목선택</th>--%>
			</tr>
		</thead>   

		<tbody>
		
<div class="preloader-wrapper big active" style="left:50%;">
      <div class="spinner-layer spinner-blue">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-red">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-yellow">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-green">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>
    </div>
		
		</tbody>
		
		</table>
		</div>
		<div>
		<p style="font-size:13px; color:grey">※ 예약한 이용시간 2시간 전 환불 불가</p>
		</div>
</div>	
<%-- 페이징 --%>
<div class="row">
	<div class="col s12 center-align">
		<div class="pager center">
			<ul class="pagination" id="pagination">
			</ul>
		</div>
	</div>
</div>
</c:if>
<div class="col s1 "></div>
</div>
</div>
</section>
<jsp:include page="../foot.jsp"/>
		</c:when>

	<c:otherwise>

	<div id="demo-modal" class="modal">
		<div class="modal-content">
			<h5 style='color:red'>※접근 오류!</h5>
				<p class="left-align">잘못된 접근입니다.</p>
		</div>
		<div class="modal-footer">
			<a href="${pageContext.request.contextPath}/index.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
		</div>
	</div>

	</c:otherwise>
</c:choose>
<script type="text/javascript" src="../JS/modal.js"></script>
</body>
</html>
