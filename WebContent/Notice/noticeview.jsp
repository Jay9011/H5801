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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>읽기 ${nListView[0].n_title }</title> <!-- title에 글제목 넣기 -->
</head>
<body>
<h2>읽기 ${nListView[0].n_title }</h2>
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
<button onclick="location.href = 'notice.ho'">목록보기</button>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>


</c:otherwise>
</c:choose>