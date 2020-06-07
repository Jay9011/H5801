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
<title>Insert title here</title>
</head>
<script>
	var page;
	var search;
	var category;
	function getList() {
		$
				.ajax({
					type : "POST",
					url : "listAjax.ho",
					data : {
						'page' : page,
						'search' : search,
						'category' : category
					},
					dataType : "json",
					success : function(data) {
						if (data.status == "OK") {
							var table = "<tr><th>NO</th><th>카테고리</th><th>제목</th>\<th>작성자</th><th>작성일</th><th>조회수</th></tr>";
							if (data.count > 0) {
								var row = data.data;
								var now = new Date();
								for (var i = 0; i < row.length; i++) {
									table += "<tr>";
									table += "<td>" + row[i].postId + "</td>";
									table += "<td>" + row[i].categoryName
											+ "</td>";
									table += "<td><a href='view.ho?s_uid=" + row[i].postId + "'>" + row[i].title + "</a></td>";
									table += "<td>" + row[i].nickname + "</td>";
									if ((Math
											.ceil((now - new Date(row[i].date))
													/ (1000 * 3600 * 24)) - 1) == 0) {
										table += "<td>" + row[i].dateTime
												+ "</td>";
									} else {
										table += "<td>" + row[i].dateDay
												+ "</td>";
									}
									table += "<td>" + row[i].viewcnt + "</td>";
									table += "</tr>";
								}
							} else {
								table += "<tr>";
								table += "<td colspan='6'>" + data.message
										+ "</td>";
								table += "</tr>";
							}
							$("#postList").html(table);

							var paging = "<ul>";
							if (data.page > data.writePages) {
								paging += "<li><a href='javascript:isPaging("
										+ (data.blockStartNum - 1)
										+ ")'>◀</a></li>";
							}
							for (i = data.blockStartNum; i <= data.blockLastNum; i++) {
								if (i > data.totalPage) {
									paging += "<li>" + i + "</li>";
								} else if (i == data.page) {
									paging += "<li class='selected'>" + i
											+ "</li>";
								} else {
									paging += "<li><a href='javascript:isPaging("
											+ i + ")'>" + i + "</a></li>"
								}
							}
							if (data.totalPage > data.blockLastNum) {
								paging += "<li><a href='javascript:isPaging("
										+ (data.blockLastNum + 1)
										+ ")'>▶</a></li>";
							}
							paging += "</ul>";
							$(".pager").html(paging);

						} else if (data.status == "FAIL") {
						}
					},
					error : function(e) {
						console.log("ERROR : ", e);
						alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
					}
				});
	}
	function isSearch() {
		page = 1;
		search = $("#search").val();
		search = search.trim().replace(/ /g, "|");
		getList();
	}
	function isPaging(num) {
		page = num;
		getList();
	}
	$(function() {
		$('select').formSelect();
		$('#category').on('change', function() {
			page = 1;
			category = $(this).val();
			getList();
		});
	});
	getList();
</script>
<body>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="../header.jsp" />
	<section class="container section scrollspy" id="intro">
		<div class="row">
			<div class="col s1 "></div>
			<div class="col s10">
				<h3 class="center-align pfont">학습 문의 게시판</h3>
				<p>현재 로그인중인 유저 : ${nick }</p>
				<div class="category-field input-field col m6">
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
				<table id="postList" class="highlight">
				</table>

				<div class="pager"></div>
				<c:if test="${uid != null}">
					<button class="col m2 offset-m10 btn waves-effect waves-light" onclick="location.href='write.ho'">글쓰기</button>
				</c:if>
				<c:if test="${uid == null}">
					<button onclick="location.href='${pageContext.request.contextPath}/User/login.ho'">로그인</button>
				</c:if>
				<div class="clear"></div>
				<div id="searchBlock" class="clear">
					<form id="searchFrm" onsubmit="return false;">
						<input id="search" class="col m9" name="searchBox" type="text" onKeypress="">
						<button class="searchbtn col m3 waves-effect waves-light btn" onclick="isSearch()">검색</button>
					</form>
				</div>
			</div>
			<div class="col s1"></div>
		</div>
	</section>
	<jsp:include page="../foot.jsp" />
</body>
</html>