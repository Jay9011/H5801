<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${empty viewInfo || fn:length(viewInfo) == 0 }">
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
<title>읽기 ${viewInfo[0].s_title}</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<script>
function chkDelete(s_uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("정말로 삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.ho?s_uid=' + s_uid;
	} else {

	}
}
function chkSubmit(){
	frm = document.forms["commentTable"];
	var content = frm["content"].value.trim();

	if(content == ""){
		alert("내용은 반드시 작성해야 합니다.");
		frm["content"].focus();
		return false;
	}
	return true;
}
</script>
<body>
<h2>읽기 ${viewInfo[0].s_title}</h2>
<br>
작성자 : ${viewInfo[0].m_nick}<br>
제목 : ${viewInfo[0].s_title}<br>
등록일 : ${viewInfo[0].s_date}<br>
조회수 : ${viewInfo[0].s_viewCnt}<br>
<hr>
내용 : <br>
<div>
${viewInfo[0].s_content}
</div>
<hr>
<br>
<button onclick="location.href = 'list.ho'">목록보기</button>
<c:if test="${m_uid == viewInfo[0].m_uid }">
	<button onclick="location.href = 'update.ho?uid=${viewInfo[0].s_uid}'">수정하기</button>
</c:if>
<c:if test="${m_uid == viewInfo[0].m_uid || m_grade > 8}">
	<button onclick="chkDelete(${viewInfo[0].s_uid})">삭제하기</button>
</c:if>
<c:if test="${m_uid != null}">
	<button onclick="location.href = 'write.ho'">글쓰기</button>
</c:if>
<hr />
<c:if test="${m_uid != null}">
	<form name="commentTable" action="commentOk.ho" method="get" onsubmit="return chkSubmit()">
		<input type="hidden" name="s_uid" value="${viewInfo[0].s_uid" />
		<input type="hidden" name="m_uid" value="${m_uid }" />
		작성자: <input type="text" name="m_name" value="${m_name }" disabled="disabled"/><br>
		<br><textarea id="editor1" name="content"></textarea><br>
		<br> <input type="submit" value="등록" />
	</form>
</c:if>
<script>
		CKEDITOR.replace( 'editor1' );
	</script>
</body>
</html>
	</c:otherwise>
</c:choose>