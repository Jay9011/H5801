<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<c:choose>
	<c:when test="${grade > 8 }">
	<h1>Write</h1>
	<form name="writeTable" action="writeOk.ho" method="post" onsubmit="return chkSubmit()">

		<br>
		제목: <input type="text" name="subject" /><br>
		내용:
		<br><textarea id="editor1" name="content"></textarea><br>
		<br> <input type="submit" value="등록" />
	</form>
	<br>
	<button type="button" onclick="location.href='notice.fc'">목록으로</button>
	<script>
		CKEDITOR.replace('editor1', {
			allowedContent: true	// HTML 태그 자동 삭제 방지 설정
			,filebrowserUploadUrl: '${pageContext.request.contextPath}/StudyBoard/fileUpload.ho'
		});
	</script>
		</c:when>
		<c:otherwise>관리자가 아닙니다.</c:otherwise>
	</c:choose>
</body>
</html>