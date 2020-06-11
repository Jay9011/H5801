<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${empty nListView || fn:length(nListView) == 0 }">
				<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <jsp:include page="../../modal.jsp"/>
		<div id="demo-modal" class="modal">
			<div class="modal-content">
				<h5>접근 실패</h5>
				<p class="left-align">해당 정보가 삭제되었거나 존재하지 않습니다.</p>
			</div>
			<div class="modal-footer">
				<a href="javascript:window.history.back();"
					class="modal-close waves-effect  btn-flat amber">확인</a>
			</div>
		</div>
		<script>	
document.addEventListener('DOMContentLoaded', function () {	
    var Modalelem = document.querySelector('.modal');	
    var instance = M.Modal.init(Modalelem, {dismissible:false, preventScrolling:false});	
    instance.open();	
});	
		</script>
	</c:when>
<c:otherwise>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/comment.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> ${nListView[0].n_title }</title> <!-- title에 글제목 넣기 -->
   </head>
   <body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		<!--  여기에다가 적어주기 (반응형은 필수이다. -->
<h3 class="center-align pfont">${nListView[0].n_title }</h3>
	<div class="row">
					<div class="col s12 pfont right-align">
UID : ${nListView[0].n_uid }<br>
등록일 : ${nListView[0].n_date }<br>
조회수 : ${nListView[0].n_viewCnt }<br>
		</div>
				</div>
	<div class="row">
							<div class="col s12"
								style="margin-left: 5px; border-radius: 5px; border: 1px solid #ffa537;">
								<div style="padding: 5% 4%">${nListView[0].n_content }</div>
							</div>
							<div class="col s1"></div>
						</div>
<div class="col s12 right-align">
<button class="btn waves-effect btn2" onclick="location.href = 'notice.ho'">목록보기</button>
	<c:choose>
	<c:when test="${grade > 8 }">
	<button class="btn waves-effect btn2" onclick="location.href = 'update.ho?n_uid=${nListView[0].n_uid }'">수정</button>
	<button class="btn waves-effect btn2" onclick="location.href = 'deleteOk.ho?n_uid=${nListView[0].n_uid }'">삭제</button>
	</c:when>
	</c:choose>
</div>

		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>
</c:otherwise>
</c:choose>