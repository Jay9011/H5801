<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="../ckeditor/ckeditor.js"></script>
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
	<h1>Write</h1>
	<form name="writeTable" action="writeOk.ho" method="post" onsubmit="return chkSubmit()">
		<input type="hidden" name="m_uid" value="${uid }" />
		작성자: <input type="text" name="m_nick" value="${nick }" disabled="disabled"/><br>
		학년: <input type="radio" name="sc_uid" value="1" checked="checked">중1
			<input type="radio" name="sc_uid" value="2">중2
			<input type="radio" name="sc_uid" value="3">중3
			<input type="radio" name="sc_uid" value="4">고1
			<input type="radio" name="sc_uid" value="5">고2
			<input type="radio" name="sc_uid" value="6">고3
			<input type="radio" name="sc_uid" value="7">대학생
		<br>
		제목: <input type="text" name="subject" /><br>
		내용:
		<br><textarea id="editor1" name="content"></textarea><br>
		<br> <input type="submit" value="등록" />
	</form>
	<br>
	<button type="button" onclick="location.href='list.ho'">목록으로</button>
	<script>
		CKEDITOR.replace('editor1', {
			allowedContent: true	// HTML 태그 자동 삭제 방지 설정
			,filebrowserUploadUrl: '${pageContext.request.contextPath}/StudyBoard/fileUpload.ho'
		});
	</script>
</body>
</html>