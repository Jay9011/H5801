<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty nListView || fn:length(nListView) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
<c:otherwise>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/comment.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> ${nListView[0].n_title }</title> <!-- title에 글제목 넣기 -->
   </head>
   <body>
<jsp:include page="../../nav.jsp"/>
<jsp:include page="../../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		<!--  여기에다가 적어주기 (반응형은 필수이다. -->
		
		
		

	<c:choose>
	<c:when test="${grade > 8 }">

<h2>${nListView[0].n_title }</h2>
<br>
UID : ${nListView[0].n_uid }<br>
제목 : ${nListView[0].n_title }<br>
등록일 : ${nListView[0].n_date }<br>
조회수 : ${nListView[0].n_viewCnt }<br>
내용: <br>
<hr>
<div>
${nListView[0].n_content }
</div>
<hr>
<br>
<div class="col s12 right-align">
<button class="btn waves-effect btn2" onclick="location.href = 'noticeControll.ho'">목록보기</button>
	<button class="btn waves-effect btn2" onclick="location.href = 'update.ho?n_uid=${nListView[0].n_uid }'">수정</button>
	<button class="btn waves-effect btn2" onclick="location.href = 'deleteOk.ho?n_uid=${nListView[0].n_uid }'">삭제</button>
</div>
	</c:when>
	</c:choose>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
		
		
		
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>
</c:otherwise>
</c:choose>