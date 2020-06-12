<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${grade > 8 }">
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../../top.jsp"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>
<script>
	function chkSubmit(){
		frm = document.forms["writeTable"];
		var subject = frm["subject"].value.trim();

		if(subject == ""){
			alert("제목은 반드시 작성해야 합니다.");
			frm["subject"].focus();
			return false;
		}
		if(CKEDITOR.instances.editor1.getData() == ""
				|| CKEDITOR.instances.editor1.getData().length == 0){
			alert("내용을 입력해 주세요.");
			frm["content"].focus();
			return false;
		}
		return true;
	}
</script>

<body>
<jsp:include page="../../nav.jsp"/>
<jsp:include page="../../header.jsp"/>
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		<!--  여기에다가 적어주기 (반응형은 필수이다. -->
		<h1 class="center-align pfont">공지사항 글 작성</h1>
	<form name="writeTable" action="writeOk.ho" method="post" onsubmit="return chkSubmit()">
        <div class="row">
		<div class="input-field col s12">
		<input type="text" id="subject" name="subject" class="validate"/>
		<label for="subject">
		제목
		</label>
		</div>
		</div>
		내용
		<br><textarea id="editor1" name="content"></textarea><br>
		<br>
		<div class="col s12 right-align" style="margin-bottom: 50px;">
			<button type="submit" class="btn waves-effect btn2" style="margin:0 10px;">등록</button>
			<button class="btn waves-effect btn2" type="button" onclick="location.href = 'noticeControll.ho'">목록으로</button>
		</div>
	</form>
	
		
		</div>
		<div class="col s1"></div>
	</div>
</section>
	
	<script>
		CKEDITOR.replace('editor1', {
			allowedContent: true	// HTML 태그 자동 삭제 방지 설정
			,filebrowserUploadUrl: '${pageContext.request.contextPath}/StudyBoard/fileUpload.ho'
		});
	</script>
<jsp:include page="../../foot.jsp"/>
<!--  js 추가는 여기에 -->
		</c:when>
		<c:otherwise>
			<link
			href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
			rel="stylesheet">
		<jsp:include page="../../modal.jsp" />
		<div id="demo-modal" class="modal">
			<div class="modal-content">
				<h5>관리자 접근 실패</h5>
				<p class="left-align">관리자가 아닙니다.</p>
			</div>
			<div class="modal-footer">
				<a href="javascript:window.history.back();"
					class="modal-close waves-effect  btn-flat amber">확인</a>
			</div>
		</div>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				var Modalelem = document.querySelector('.modal');
				var instance = M.Modal.init(Modalelem, {
					dismissible : false,
					preventScrolling : false
				});
				instance.open();
			});
		</script>
		
		</c:otherwise>
	</c:choose>
</body>


</html>