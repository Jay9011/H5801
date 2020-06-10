<%-- 예약현황 관리자 페이지--%>
<%--
  작성자: 낙경
 2020-06-10  16:00 수정
 --%>


<%--contentType="charset=UTF-8": (결과) 웹 브라우저가 받아볼 페이지의 인코딩 방식 --%>
<%--pageEncoding="UTF-8": (작업) JSP파일(페이지)에 기록된 소스코드 자체의 인코딩 방식 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- JSTL 버전으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다 --%>
<jsp:include page="../modal.jsp"/>


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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<title>MY RESERVATION</title>
<style>
.lightcyan {
    background-color: lightcyan;
}
.important {
    font-weight: bold;
}

@media screen and (max-width: 765px) and (min-width: 300px){

.table-container{
	 width:100%;	
	 overflow-x:auto;
     white-space: nowrap;
	}
   
 table{
    width:auto;
 } 
 
 }
</style>
</head>

<script>
$(document).ready(function(){
	$(":input:radio").click(function(){
		$("tr").removeClass("lightcyan");
		$("tr").removeClass("important");
		$(this).parents("tr").addClass("lightcyan");
		$(this).parents("tr").addClass("important");
	});
});
<%--function chkPaySubmit(){
	var frm = document.bookFrm;
	var p_uid = frm.p_uid.value.trim();
	if(p_uid == ""){
		alert("결제할 항목을 선택해주세요")
	    frm.p_uid.focus();
        return false;
	}

	frm.submit(); // submit 성공
}--%>

function chkPayCancelSubmit(){
	var frm = document.bookFrm;
	var p_uid = frm.p_uid.value.trim();
	if(p_uid == ""){
		alert("취소할 항목을 선택해주세요")
	    frm.p_uid.focus();
        return false;
	}

	frm.submit(); // submit 성공
}


</script>

<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	<div class="row">
	<div class="col s1 "></div>
	<div class="col s10 table-container">

		<h3 class="center-align pfont">나의 예약현황</h3>

		<c:if test="${empty book || fn:length(book) == 0}">
			<p style="text-align: center">예약된 내용이 없습니다.</p>
		</c:if>
		<c:if test="${!empty book && fn:length(book) != 0}">

		<%--<form name="bookFrm" action="${pageContext.request.contextPath}/Payment/pay.ho" method="post"> --%>
		<form name="bookFrm" action="${pageContext.request.contextPath}/Payment/refundOk.ho" method="post">
		<div class="table-container">
		<table class="highlight centered">
		<thead>
			<tr>
				<th>NO</th>
				<%--<th>결재번호</th>--%>
				<th>예약내용</th>
				<th>예약일자</th>
				<th>예약시간</th>
				<th>회원이름</th>
				<th>결제총액</th>
				<th>결제현황</th>
				<%--<th>항목선택</th>--%>

			</tr>
		</thead>

		
			<c:forEach var="dto" items="${book }">

			<tr>
				<td>#${dto.rnum }</td>
				<%--<td>${dto.p_uid }번</td>--%>
				<td>
				${dto.b_seatType }<br>
				(${dto.t_name })
				</td>
				<td>${dto.b_sdate }</td>
				<td>${dto.b_stime }~${dto.b_etime }<br>
				(${dto.b_term }시간)</td>
				<td>${dto.m_nick }</td>
				<td><fmt:formatNumber value="${dto.total_amount }" pattern="#,###"/>원</td>
				<td>
					<c:if test="${dto.p_cancel==0 }">
					-
					</c:if>
					<c:if test="${dto.p_cancel==1 }">
					결제완료
					</c:if>
					<c:if test="${dto.p_cancel==2 }">
					결제취소
					</c:if>
				</td>

				<%-- <td>
					<c:if test="${dto.b_refund==0 || dto.b_refund==null || dto.p_uid == 2}">
				    <p>
				      <label>
				        <input class="with-gap" id="p_uid" name="p_uid" type="radio" value="${dto.p_uid }" disabled/>
				        <span></span>
				      </label>
				    </p>
				    </c:if>
				    <c:if test="${dto.b_refund==1 }">
				    <p>
				      <label>
				        <input class="with-gap" id="p_uid" name="p_uid" type="radio" value="${dto.p_uid }" />
				        <span></span>
				      </label>
				    </p>
				    </c:if>
				</td>--%>

			</tr>

			</c:forEach>

		
		</table>
		</div>
		</form>
		<div>
		<p style="font-size:13px; color:grey">※ 예약한 이용시간 2시간 전 환불 불가</p>
		</div>		
<div class="row">
			<div class="col s12 center-align">
		<div class="pager center">
    <ul class="pagination">
        <c:if test="${ curPageNum > 5 }">
            <li><a href="${pageContext.request.contextPath}/MyPage/bookAdmin.ho?page=${ blockStartNum - 1 }" class='tooltip-top'><i class='material-icons'>chevron_left</i></a></li>
        </c:if>

        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
            <c:choose>
                <c:when test="${ i > lastPageNum }">
                    <li><a class='disabled'>${ i }</a></li>
                </c:when>
                <c:when test="${ i == curPageNum }">
                    <li  class='active'><a>${ i }</a></li>
                </c:when>

                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/MyPage/bookAdmin.ho?page=${ i }" >${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>


        <c:if test="${ lastPageNum > blockLastNum }">
            <li><a href="${pageContext.request.contextPath}/MyPage/bookAdmin.ho?page=${ blockLastNum + 1 }" class='tooltip-top'><i class='material-icons'>chevron_right</i></a></li>
        </c:if>
    </ul>
</div>
	</div>
		</div>

</c:if>
		  <div class="row">
            <div class="col s12 right-align">
             <%-- <button type="button" id="btn1" class="btn waves-effect" style="margin-right: 5px;" onclick="chkPaySubmit()">결제</button>
              <button type="button" id="btn2" class="btn waves-effect" onclick="chkPayCancelSubmit()">취소</button>--%>
            </div>
            </div>
          	</div>

		<div class="col s1 "></div>
	</div>
</section>
<jsp:include page="../foot.jsp"/>

	</c:when>

	<c:otherwise>

	<div id="demo-modal" class="modal">
		<div class="modal-content">
			<h5 style='color:red'>※접근 오류!</h5>
				<p class="left-align">잘못된 접근입니다. 로그인 해주세요.</p>
		</div>
		<div class="modal-footer">
			<a href="${pageContext.request.contextPath}/User/login.ho" class="modal-close waves-effect waves-green btn-flat amber">확인</a>
		</div>
	</div>

	</c:otherwise>
</c:choose>
<script type="text/javascript" src="../JS/modal.js"></script>
</body>
</html>