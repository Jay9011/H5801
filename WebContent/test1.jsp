<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/MasterControll.css">
<title>Insert title here</title>
</head>
<body>




			<table id="tbody1">
				<tbody id="tbody">
					<tr>
					<th id="top"></th>
					</tr>
					<tr>
						<th id="midle"><a id="link" href="${pageContext.request.contextPath}/AdminPage/MyPage/bookAdmin.ho">예약현황<br>관리하기</a></th>
					</tr>
					<tr>
						<th id="midle"><a id="link" href="${pageContext.request.contextPath}/AdminPage/Faq/faqControll.ho">FAQ<br>관리하기</a></th>
					</tr>
					<tr>
						<th id="midle"><a id="link" href="${pageContext.request.contextPath}/AdminPage/Faq/faqControll.ho">Notice<br>관리하기</a></th>
					</tr>
					<tr>
					<th id="buttom"></th>
					</tr>
				</tbody>
			</table>
			
			
			
			
			
			<!-- 보더에 색상주기 / z-index 1 상위존재 / wh right 10 = 우측으로 10 변동 / jq 모바일모드에서 사라지게하기 / 서브메뉴구현 -->
</body>
</html>

