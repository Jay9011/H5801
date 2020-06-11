<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:if test="${email != null }">
		<script>
	$(document).ready(function() {
		$("ul.Hnav li button.btnIn ").css('display', 'none');
		$("ul.Hnav .btnOut").css('display', 'inline-block');
		$("ul.Hnav .btnOut2").css('display', 'block');
		$('.loginNN').click(function() {
			$(this).attr('href', '${pageContext.request.contextPath}/Reservation/reservation.ho');
		});
	});
</script>
	</c:if>
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
						<li><a href="${pageContext.request.contextPath}/Intro/introduce.ho#i_intro">Holic 소개</a></li>
						<li><a href="${pageContext.request.contextPath}/Intro/introduce.ho#i_room">스터디룸 소개</a></li>
						<li><a href="${pageContext.request.contextPath}/Intro/introduce.ho#i_map">오시는 길</a></li>
					</ul></li>
				<li><a class="loginNN modal-trigger" href="#modal1">독서실 예약</a></li>
				<li><a href="${pageContext.request.contextPath}/StudyBoard/list.ho">학습 문의</a></li>
				<li><a class="dropdown-trigger" data-target="dropdown2">고객
						지원</a>
					<ul id='dropdown2' class='dropdown-content'>
						<li><a href="${pageContext.request.contextPath}/Notice/notice.ho">공지사항</a></li>
						<li><a href="${pageContext.request.contextPath}/Faq/faq.ho">FAQ</a></li>
					</ul></li>
				<li><a class="dropdown-trigger btnOut" data-target="dropdown3"
					style="display: none;">마이페이지</a>
					<ul id='dropdown3' class='dropdown-content'>


						<li><a href="${pageContext.request.contextPath}/MyPage/book2.ho">예약현황</a></li>
						<li><a href="${pageContext.request.contextPath}/MyPage/list.ho">게시물 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/MyPage/reInfo.ho">정보수정</a></li>
						    <c:choose>
						    <c:when test="${grade > 8 }">
								<li><a href="${pageContext.request.contextPath}/AdminPage/MasterControll.ho">관리페이지</a></li>
							</c:when>
							</c:choose>						
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
<ul class="sidenav  amber lighten-5 Hnav" id="mobile-menu">
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
	<li><a  class="loginNN modal-trigger" href="#modal1">독서실 예약</a></li>
	<li><a href="${pageContext.request.contextPath}/StudyBoard/list.ho">학습 문의</a></li>
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
						<li><a href="${pageContext.request.contextPath}/MyPage/book2.ho">예약현황</a></li>
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

<div id="topBtn" class="z-depth-2" onclick=" $('html, body').stop().animate({scrollTop: 0});">
<i class="material-icons dp48 center-align">keyboard_tab</i>
</div>

 <div id="modal1" class="modal modal1">
    <div class="modal-content">
      <h5>로그인이 필요한 서비스</h5>
      <p class="left-align">로그인이 필요한 서비스 입니다.<br>로그인 창으로 이동하시겠습니까?</p>
    </div>
    <div class="modal-footer">
      <a href="${pageContext.request.contextPath}/User/login.ho"  class="modal-close waves-effect  btn-flat amber">로그인</a>
      <a href="#!" class="modal-close waves-effect btn-flat lime lighten-5">취소</a>
    </div>
  </div>
  <script>
  $(document).ready(function(){
	    $('.modal1').modal();
	  });
  </script>
