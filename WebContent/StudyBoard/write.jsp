<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../top.jsp"/>
 <title>글 쓰기</title>
<script src="../ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
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
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		<!--  여기에다가 적어주기 (반응형은 필수이다. -->
		<h1 class="center-align pfont">새로운 글</h1>
	<form name="writeTable" action="writeOk.ho" method="post" onsubmit="return chkSubmit()">
		<input type="hidden" name="m_uid" value="${uid }" />
		<div>
		<span>학년 &emsp;</span>
        <label>
            <input type="radio" name="sc_uid" value="1" checked="checked">
            <span>중1</span>
        </label> &emsp;
        <label>
            <input type="radio" name="sc_uid" value="2">
            <span>중2</span>
        </label> &emsp;
        <label>
            <input type="radio" name="sc_uid" value="3">
            <span>중3</span>
        </label> &emsp;
        <label>
            <input type="radio" name="sc_uid" value="4">
            <span>고1</span>
        </label> &emsp;
        <label>
            <input type="radio" name="sc_uid" value="5">
            <span>고2</span>
        </label> &emsp;
        <label>
            <input type="radio" name="sc_uid" value="6">
            <span>고3</span>
        </label> &emsp;
        <label>
            <input type="radio" name="sc_uid" value="7">
            <span>대학생</span>
        </label> &emsp;
        </div>
        <div class="row">
		<div class="input-field col s12">
		<input type="text" id="subject" name="subject" class="validate" data-length="50"/>
		<label for="subject">
		제목
		</label>
		</div>
		</div>
		내용:
		<br><textarea id="editor1" name="content"></textarea><br>
		<br>
		<div class="col s12 right-align" style="margin-bottom: 50px;">
			<button type="submit" class="btn waves-effect btn2" style="margin:0 10px;">등록</button>
			<button class="btn waves-effect btn2" type="button" onclick="location.href = 'list.ho'">목록으로</button>
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

		$(document).ready(function() {
		    $('#subject').characterCounter();
		  });
	</script>
<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>