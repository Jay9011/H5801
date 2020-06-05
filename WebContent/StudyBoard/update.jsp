<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${empty selected || fn:length(selected) == 0}">
		<script>
			alert("해당 정보가 삭제되었거나 존재하지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정 ${selected[0].s_title}</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var subject = frm['subject'].value.trim();

	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다.");
		frm['subject'].focus();
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
<h2>수정</h2>
<form action="updateOk.ho" name="frm" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="s_uid" value="${selected[0].s_uid}"/>
작성자: <input type="text" name="m_nick" value="${m_nick }" disabled="disabled"/><br>
제목 : <input type="text" name="subject" value="${selected[0].s_title}" /><br>
<hr>
내용 :
<br><textarea id="editor1" name="content">${selected[0].s_content}</textarea><br>
<br> <input type="submit" value="수정" />
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
	</c:otherwise>
</c:choose>