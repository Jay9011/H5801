<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
	<c:when test="${empty selected || fn:length(selected) == 0}">
		<script>
			alert("해당 정보가 삭제되었거나 존재하지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../top.jsp" />
<title>글 수정</title>
<script src="../ckeditor/ckeditor.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/inputc.css">
</head>
<script>
	function chkSubmit() {
		frm = document.forms['frm'];
		var subject = frm['subject'].value.trim();

		if (subject == "") {
			alert("제목은 반드시 작성해야 합니다.");
			frm['subject'].focus();
			return false;
		}
		if (content == "") {
			alert("내용은 반드시 작성해야 합니다.");
			frm["content"].focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="../header.jsp" />
	<section class="container section scrollspy" id="intro">
		<div class="row">
			<div class="col s1 "></div>
			<div class="col s10">
				<h1 class="center-align pfont">수정</h1>
				<form action="updateOk.ho" name="frm" method="post"
					onsubmit="return chkSubmit()">
					<input type="hidden" name="s_uid" value="${selected[0].s_uid}" /> <input
						type="text" name="m_nick" value="${nick }" disabled="disabled" />
					<label for="subject">제목</label> 
					<input type="text" id="subject" name="subject" value="${selected[0].s_title }" class="validate" />
					내용 : <br>
					<textarea id="editor1" name="content">${selected[0].s_content}</textarea>
					<div class="col s12 right-align" style="margin-top: 50px;">
						<button type="submit" class="btn waves-effect btn2"
							style="margin: 0 10px;">수정</button>
						<button class="btn waves-effect btn2" type="button"
							onclick="location.href='list.ho'">목록으로</button>
					</div>
				</form>
			</div>
			<div class="col s1"></div>
		</div>
	</section>
	<script>
		CKEDITOR
				.replace(
						'editor1',
						{
							allowedContent : true // HTML 태그 자동 삭제 방지 설정
							,
							filebrowserUploadUrl : '${pageContext.request.contextPath}/StudyBoard/fileUpload.ho'
						});
	</script>
	<jsp:include page="../foot.jsp" />
	<!--  js 추가는 여기에 -->
</body>
</html>