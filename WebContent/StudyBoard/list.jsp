<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../top.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/inputc.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/studylist.css">
<title>학습 문의 게시판</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/studylist.js"></script>
<body>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="../header.jsp" />
	<section class="container section scrollspy" id="intro">
		<div class="row">
			<div class="col m1"></div>
			<div class="col s12 m10">
				<h3 class="center-align pfont">학습 문의 게시판</h3>
				<div class="category-field input-field col s6 offset-s6">
					<select id="category" class="" name="category">
						<option value="0" selected="selected">전체</option>
						<option value="1">중1</option>
						<option value="2">중2</option>
						<option value="3">중3</option>
						<option value="4">고1</option>
						<option value="5">고2</option>
						<option value="6">고3</option>
						<option value="7">대학생</option>
					</select>
				</div>
				<div style="width: 100%;">
				<table id="postList" class="highlight ">
						<div class="preloader-wrapper big active" style="left:50%;">
							<div class="spinner-layer spinner-blue">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>

							<div class="spinner-layer spinner-red">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>

							<div class="spinner-layer spinner-yellow">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>

							<div class="spinner-layer spinner-green">
								<div class="circle-clipper left">
									<div class="circle"></div>
								</div>
								<div class="gap-patch">
									<div class="circle"></div>
								</div>
								<div class="circle-clipper right">
									<div class="circle"></div>
								</div>
							</div>
						</div>
					</table>
				</div>
				<div class="pager center-align"></div>
				<c:if test="${uid != null}">
					<button class="col s2 offset-s10 btn waves-effect btn2" onclick="location.href='write.ho'" style="margin-bottom:30px">글쓰기</button>
				</c:if>

				<div class="clear"></div>
				<div id="searchBlock" class="clear">
					<form id="searchFrm" onsubmit="return false;">
					<div class="col l2" ></div>
						<input id="search" class="col xl6 l7 m9 s9" name="searchBox" type="text" onKeypress="">
						<button class="searchbtn col xl3 l5 m3 btn waves-effect btn2" onclick="isSearch()">검색</button>
					</form>
				</div>
			</div>
			<div class="col m1"></div>
		</div>
	</section>
	<script>
		getList();
	</script>
	<jsp:include page="../foot.jsp" />
</body>
</html>