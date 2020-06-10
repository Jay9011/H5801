<%-- 예약현황 --%>
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<%-- JSTL 버전으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다 --%>
<jsp:include page="../modal.jsp"/>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="${pageContext.request.contextPath }/JS/book.js"></script>
<title>MY RESERVATION</title>
<style>
.lightcyan {
    background-color: lightcyan;
}
.important {
    font-weight: bold;
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




function chkPaySubmit(){
	var frm = document.bookFrm;
	var p_uid = frm.p_uid.value.trim();
	if(p_uid == ""){
		alert("결제할 항목을 선택해주세요")                                   
	    frm.p_uid.focus();
        return false;	
	}
	
	frm.submit(); // submit 성공
}

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
	<div class="col s10">

		<h3 class="center-align pfont">나의 예약현황</h3>
		<div id = "list">
			<div>
				<div id="pageinfo"></div>
				<div id="pageRows"></div>
			</div>
			<div class="clear"></div>

		<%--<form name="bookFrm" action="${pageContext.request.contextPath}/Payment/pay.ho" method="post"> --%>
		<form name="bookFrm" action="${pageContext.request.contextPath}/Payment/pay.ho" method="post">
		
		<%--<form name="bookFrm" action="${pageContext.request.contextPath}/Payment/refundOk.ho" method="post">--%>
		<table class="highlight centered" id="table">

		<thead>
	
				<th>예약번호</th>
				<%--<th>결재번호</th>--%>
				<th>예약내용</th>
				<th>예약일자</th>
				<th>예약시간</th>
				<th>회원이름</th>
				<th>결제총액</th>
				<th>결제현황</th>
				<th>항목선택</th>

			
		</thead>   

		<tbody>
		
		</tbody>
			
			
		
		</table>
		</form>
	
</div>

<%-- 페이징 --%>

<div class="center">
	<ul class="pagination" id="pagination">
	
	</ul>

</div>


	
		  <div class="row">
            <div class="col s12 right-align">
              <button type="button" id="btn1" class="btn waves-effect" style="margin-right: 5px;" onclick="chkPaySubmit()">결제</button>
              <button type="button" id="btn2" class="btn waves-effect" onclick="chkPayCancelSubmit()">취소</button>
            </div>
            </div>
          	</div>
			
		<div class="col s1 "></div>
	</div>
</section>

<jsp:include page="../foot.jsp"/>	

	

<script type="text/javascript" src="../JS/modal.js"></script>
</body>
</html>
