<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<script>
	function chkSubmit(){
		frm = document.forms["writeTable"];
		var subject = frm["subject"].value.trim();
		var content = frm["content"].value.trim();

		if(subject == ""){
			alert("제목은 반드시 작성해야 합니다.");
			frm["subject"].focus();
			return false;
		}
		if(content == ""){
			alert("내용은 반드시 작성해야 합니다.");
			frm["content"].focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<h1>Write</h1>
	<form name="writeTable" action="writeOk.ho" method="post" onsubmit="return chkSubmit()">
		<input type="hidden" name="m_uid" value="${m_uid }" />
		작성자: <input type="text" name="m_name" value="${m_name }" disabled="disabled"/><br>
		제목: <input type="text" name="subject" /><br>
		내용:
		<br><textarea id="editor1" name="content"></textarea><br>
		<br> <input type="submit" value="등록" />
	</form>
	<br>
	<button type="button" onclick="location.href='list.ho'">목록으로</button>
	<script>
		CKEDITOR.replace( 'editor1' );
	</script>
</body>
</html>