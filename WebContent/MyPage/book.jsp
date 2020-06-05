<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-05  16:00 수정
 --%>

<%--contentType="charset=UTF-8": (결과) 웹 브라우저가 받아볼 페이지의 인코딩 방식 --%>
<%--pageEncoding="UTF-8": (작업) JSP파일(페이지)에 기록된 소스코드 자체의 인코딩 방식 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%-- JSTL 버전으로 바뀌니, import 번잡함도 사라진다. JAVA 변수 선언도 사라진다 --%>
<c:choose>
<c:when test="${uid == null }">
	<script>
		alert("잘못된 접근입니다. 로그인 해주세요.")
		location.href = "${pageContext.request.contextPath}/User/login.ho";
	</script>
</c:when>
<c:when test="${uid != null }">
<!DOCTYPE html>
<html lang="ko">
<!-- head: 현재 문서의 정보를 제공하는 역할 -->
<head>
<!-- Meta Data: 다른 데이터를 설명해주는 데이터, charset: Character set(구성문자 집합, 문자셋)-->
<meta charset="UTF-8">
<!-- width=device-width: 브라우저(페이지) 너비를 장치(기기) 너비와 동일하게 설정 -->
<!-- initial-scale=1.0(100%): 뷰포트의 초기 배율 (로딩시 확대/축소 없는 원래 크기, 범위: 0~10)-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/indexmain.css">
<title>MY RESERVATION</title>
<style>
h3 {
	margin-top: 0;
	border-bottom: 1px dotted #666;
	padding: 5px 0;
}
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>


		<hr>
		<h3>▶ 예약 현황</h3>
		<table>
			<tr>
				<th>결재번호</th>
				<th>예약내용</th>
				<th>예약일자</th>
				<th>예약시간</th>
				<th>회원이름</th>
				<th>결제총액</th>
				<th>결제현황</th>
			</tr>
			
		<c:choose>
			<c:when test="${empty book || fn:length(book) == 0}">
			</c:when>
			<c:otherwise>
			
			<c:forEach var="dto" items="${book }">
			
			<tr>
				<td>${dto.p_uid }</td>
				<td>${dto.b_seatType }</td>
				<td>${dto.b_sdate }</td>
				<td>${dto.b_term }</td>
				<td>${dto.m_nick }</td>
				<td>${dto.total_amount }</td>
				<td>${dto.b_refund }</td>
			</tr>

			</c:forEach>
			
			</c:otherwise>
		</c:choose>

		</table>
		<br>
		<button onclick="location.href='write.do'">신규등록</button>



</body>
</html>
	</c:when>
</c:choose>