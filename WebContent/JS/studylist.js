var page;
var search;
var category;
function getList() {
	$.ajax({
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
				var table = "<thead><tr><th>NO</th><th style='width:75px'>카테고리</th><th>제목</th>\<th class='writer'>작성자</th><th class='writedate'>작성일</th><th class='viewcount'>조회수</th></tr></thead>";
				if (data.count > 0) {
					var row = data.data;
					var now = new Date();
					for (var i = 0; i < row.length; i++) {
						table += "<tr>";
						table += "<td>" + row[i].postId + "</td>";
						table += "<td>" + row[i].categoryName
								+ "</td>";
						table += "<td><a href='view.ho?s_uid=" + row[i].postId + "'>" + row[i].title + "</a></td>";
						table += "<td class='writer'>" + row[i].nickname + "</td>";
						if ((Math.ceil((now - new Date(row[i].date))
										/ (1000 * 3600 * 24)) - 1) == 0) {
							table += "<td class='writedate'>" + row[i].dateTime
									+ "</td>";
						} else {
							table += "<td class='writedate'>" + row[i].dateDay
									+ "</td>";
						}
						table += "<td class='viewcount'>" + row[i].viewcnt + "</td>";
						table += "</tr>";
					}
				} else {
					table += "<tr>";
					table += "<td colspan='6'>" + data.message
							+ "</td>";
					table += "</tr>";
				}
				$(".preloader-wrapper").remove();
				$("#postList").html(table);

				var paging = "<ul class='pagination'>";
				if (data.page > data.writePages) {
					paging += "<li><a href='javascript:isPaging("
							+ (data.blockStartNum - 1)
							+ ")'><i class='material-icons'>chevron_left</i></a></li>";
				}
				for (i = data.blockStartNum; i <= data.blockLastNum; i++) {
					if (i > data.totalPage) {
						paging += "<li><a class='disabled'>" + i + "</a></li>";
					} else if (i == data.page) {
						paging += "<li class='active'><a>" + i
								+ "</a></li>";
					} else {
						paging += "<li><a href='javascript:isPaging("
								+ i + ")'>" + i + "</a></li>"
					}
				}
				if (data.totalPage > data.blockLastNum) {
					paging += "<li><a href='javascript:isPaging("
							+ (data.blockLastNum + 1)
							+ ")'><i class='material-icons'>chevron_right</i></a></li>";
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
	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	search = $("#search").val();
	if(regExp.test(search)){
		var t = search.replace(regExp, "");
		search = t;
	}
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