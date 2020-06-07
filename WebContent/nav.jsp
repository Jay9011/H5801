<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${email != null }">
		<script>
	$(document).ready(function() {
		$("ul.Hnav li button.btnIn ").css('display', 'none');
		$("ul.Hnav .btnOut").css('display', 'inline-block');
		$("ul.Hnav .btnOut2").css('display', 'block');
		$('.loginNN').click(function() {
			$(this).attr('href', '${pageContext.request.contextPath}/StudyBoard/reservation.ho');
		});
		$('.loginNN2').click(function() {
			$(this).attr('href', '${pageContext.request.contextPath}/StudyBoard/list.ho');
		});
	});
</script>
	</c:when>
	<c:otherwise>
		<script>
$(document).ready(function() {
	$("[class^='loginNN']").click(function() {
		var a = confirm("로그인은 필수입니다.\n 로그인하시겠습니까?");
		if(a){
			location.replace("${pageContext.request.contextPath}/User/login.ho");
		}
	});

});
</script>
	</c:otherwise>
</c:choose>
<!-- navbar -->
<!--  여기 realnavbar -->
<div class="navbar-fixed">
	<!--transparent 배경css 투명하게 하기-->
	<nav class="nav-wrapper">
		<div class="container">
			<a href="${pageContext.request.contextPath}/index.ho" class="alogo">Holic</a>
			<a href="#" class="sidenav-trigger" data-target="mobile-menu"> <i
				class="material-icons">menu</i>
			</a>
			<!-- 화면의 크기가 줄어들면 숨기기 -->
			<ul class="right hide-on-med-and-down Hnav">
				<li><a class="dropdown-trigger" data-target="dropdown1">Holic 소개</a>
					<ul id='dropdown1' class='dropdown-content'>
						<li><a href="#!">Holic 소개</a></li>
						<li><a href="#!">스터디룸 소개</a></li>
						<li><a href="#!">오시는 길</a></li>
					</ul></li>
				<li><a class="loginNN">독서실 예약</a></li>
				<li><a class="loginNN2">학습 문의</a></li>
				<li><a class="dropdown-trigger" data-target="dropdown2">고객
						지원</a>
					<ul id='dropdown2' class='dropdown-content'>
						<li><a href="#!">공지사항</a></li>
						<li><a href="#!">FAQ</a></li>
					</ul></li>
				<li><a class="dropdown-trigger btnOut" data-target="dropdown3"
					style="display: none;">마이페이지</a>
					<ul id='dropdown3' class='dropdown-content'>


						<li><a href="${pageContext.request.contextPath}/MyPage/book.ho">예약현황</a></li>
						<li><a href="${pageContext.request.contextPath}/MyPage/list.ho">게시물 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/MyPage/reInfo.ho">정보수정</a></li>

					</ul></li>
				<li>
					<button class="btn waves-effect waves-red btnIn"
						onclick="location.href='${pageContext.request.contextPath}/User/login.ho'">로그인</button>
					<button style="display: none;"
						class="btn waves-effect waves-red btnOut"
						onclick="location.href='${pageContext.request.contextPath}/User/logout.ho'">로그아웃</button>
				</li>

			</ul>
		</div>
	</nav>
</div>
<!-- 모바일 메뉴로 표시해줄 수 있게 -->
<ul class="sidenav deep-orange lighten-2 Hnav" id="mobile-menu">
	<li class="no-padding">
		<ul class="collapsible collapsible-accordion">
			<li><a class="collapsible-header apad">Holic 소개</a>
				<div class="collapsible-body">
					<ul>
						<li><a href="#!">Holic 소개</a></li>
						<li><a href="#!">스터디룸 소개</a></li>
						<li><a href="#!">오시는 길</a></li>
					</ul>
				</div></li>
		</ul>
	</li>
	<li><a class="loginNN">독서실 예약</a></li>
	<li><a class="loginNN2">학습 문의</a></li>
	<li class="no-padding">
		<ul class="collapsible collapsible-accordion">
			<li><a class="collapsible-header apad">고객 지원</a>
				<div class="collapsible-body">
					<ul>
						<li><a href="#!">공지사항</a></li>
						<li><a href="#!">FAQ</a></li>
					</ul>
				</div></li>
		</ul>
	</li>
	<li class="no-padding">
		<ul class="collapsible collapsible-accordion">
			<li><a style="display: none;"
				class="collapsible-header apad btnOut2">마이페이지</a>
				<div class="collapsible-body">
					<ul>
						<li><a href="${pageContext.request.contextPath}/MyPage/book.ho">예약현황</a></li>
						<li><a href="${pageContext.request.contextPath}/MyPage/list.ho">게시물 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/MyPage/reInfo.ho">정보수정</a></li>
					</ul>
				</div></li>
		</ul>
	</li>
	<li style="text-align: center; padding: 50px 0 0 0;">
		<button class="btn waves-effect waves-red btnIn"
			onclick="location.href='${pageContext.request.contextPath}/User/login.ho'">로그인</button>
		<button style="display: none;"
			class="btn waves-effect waves-red btnOut"
			onclick="location.href='${pageContext.request.contextPath}/User/logout.ho'">로그아웃</button>
	</li>
</ul>
<!--  여기 realHeader end (뺴야되요 부분 삭제후 가져가기 -->