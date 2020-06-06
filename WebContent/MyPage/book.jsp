<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-05  16:00 수정
 --%>

<%--contentType="charset=UTF-8": (결과) 웹 브라우저가 받아볼 페이지의 인코딩 방식 --%>
<%--pageEncoding="UTF-8": (작업) JSP파일(페이지)에 기록된 소스코드 자체의 인코딩 방식 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%-- JSTL 버전으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다 --%>
<c:choose>

<c:when test="${uid != null }">
<!DOCTYPE html>
<html lang="ko">
<!-- head: 현재 문서의 정보를 제공하는 역할 -->
<head>
<!-- Meta Data: 다른 데이터를 설명해주는 데이터, charset: Character set(구성문자 집합, 문자셋)-->
<meta charset="UTF-8">
<!-- width=device-width: 브라우저(페이지) 너비를 장치(기기) 너비와 동일하게 설정 -->
<!-- initial-scale=1.0(100%): 뷰포트의 초기 배율 (로딩시 확대/축소 없는 원래 크기, 범위: 0~10)-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../top.jsp"/>

<title>MY RESERVATION</title>
<style> 
h3 {
	margin-top: 0;
	border-bottom: 1px dotted #666;
	padding: 5px 0;
}
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>

<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	 <div class="row">
	 <div class="col s1 "></div>
		<div class="col s10">

		<h3 class="center-align pfont">MY RESERVATION</h3>
		<table>
			<tr>
				<th>결재번호</th>
				<th>예약내용</th>
				<th>예약일자</th>
				<th>예약시간</th>
				<th>회원이름</th>
				<th>결제총액</th>
				<th>결제현황</th>
			</tr>
			
		<c:choose>
			<c:when test="${empty book || fn:length(book) == 0}">
			</c:when>
			<c:otherwise>
			
			<c:forEach var="dto" items="${book }">
			
			<tr>
				<td>${dto.p_uid }</td>
				<td>${dto.b_seatType }</td>
				<td>${dto.b_sdate }</td>
				<td>${dto.b_term }</td>
				<td>${dto.m_nick }</td>
				<td>${dto.total_amount }</td>
				<td>${dto.b_refund }</td>
			</tr>

			</c:forEach>
			
			</c:otherwise>
		</c:choose>

		</table>
		<div class="pager">
			<ul>
				<c:if test="${curPageNum > 5 && !empty kwd }">
					<li><a href="book.ho?menu=1&page=${blockStartNum -1 }&kwd=${kwd }">◀</a></li>
				</c:if>
				<c:if test="${curPageNum > 5 }">
					<li><a href="book.ho?menu=1&page=${blockStartNum -1 }">◀</a></li>
				</c:if>
				
				<c:forEach var="i" begin="${blockStartNum }" end="${blockLastNum }">
					<c:choose>
						<c:when test="${i>lastPageNum }">
							<li>${i }</li>
						</c:when>
						<c:when test="${i == curPageNum }">
							<li class="selected">${i }</li>
						</c:when>
						<c:when test="${!empty kwd }">
							<li><a href="book.ho?menu=1&a=search&page=${i }&kwd=${kwd }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="book.ho?menu=1&page=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${lastPageNum > blockLastNum && !empty kwd }">
					<li><a href="book.ho?menu=1&a=search&page=${blockLastNum +1 }&kwd=${kwd }">▶</a></li>
				</c:if>
				<c:if test="${lastPageNum > blockLastNum }">
					<li><a href="book.ho?menu=1&a=search&page=${blockLastNum +1 }">▶</a></li>
				</c:if>
			</ul>
		</div>
		<br>
		<div class="row">
				<div class="col s8 14 right-align"></div>
				<div class="col s2 14 right-align">
	                <button type="button" class="btn waves-effect" onclick="chkEmailSubmit()">결제</button>
				</div>
	        
				<div class="col s2 14 right-align">
	                <button type="button" class="btn waves-effect" onclick="chkEmailSubmit()">취소</button>
	            </div>
        </div>
          	
			</div>
		<div class="col s1 "></div>
	</div>
</section>

</body>
</html>
<jsp:include page="../foot.jsp"/>
	</c:when>
	<c:otherwise>
		<script>
			alert("잘못된 접근입니다. 로그인 해주세요.")
			location.href = "${pageContext.request.contextPath}/User/login.ho";
		</script>
	</c:otherwise>
</c:choose>