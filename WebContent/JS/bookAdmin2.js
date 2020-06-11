var page; // 현재 페이지
var pageRows; // 한 페이지에 보여지는 게시글 개수
var uid;

$(document).ready(function(){
	// 게시판 목록 1페이지 로딩
	loadPage(page);
	
});

//page 번째 페이지 로딩
function loadPage(page){
	
	$.ajax({
		url : "bookAdmin2.ajax?page=" + page + "&pageRows=" + pageRows
		, type : "POST"
		, cache : false
		, success : function(data, status){
			if(status == "success"){
				//alert("AJAX 성공");
				$(".preloader-wrapper").remove();
				updateList(data);
			}			
		}
	});
} // end loadPage()

// 
function updateList(jsonObj){
	result = ""; 
	
	if(jsonObj.status == "OK"){
		
		var count = jsonObj.count;
		
		// 전역변수 업데이트!
		window.page = jsonObj.page;
		window.pageRows = jsonObj.pagerows;
		
		var i;
		var items = jsonObj.data;   // 배열
		for(i = 0; i < count; i++){
			result += "<tr onclick='select()'>\n";
			result += "<td>" + items[i].rnum +"</td>\n";
			result += "<td>" + items[i].b_seatType+"("+"Room"+items[i].t_name+")"+ "</td>\n";
			result += "<td>" + items[i].b_sdate + "</td>\n";
			result += "<td>" + numberWithCommas(items[i].total_amount)+"원"+ "</td>\n";
			if(items[i].p_cancel== 1){
				result += "<td>결제 완료</td>\n";
				} else if (items[i].p_cancel== 2){
				result += "<td>결제 취소</td>\n";
				} // end if		
		
			result += "<td>" + items[i].m_nick + "</td>\n";
			result += "</tr>\n";
		} // end for
		$("#list tbody").html(result);  // 테이블 업데이트!
		
		// 페이지 정보 업데이트
		$("#pageinfo").text(jsonObj.page + " / " + jsonObj.totalpage + " (총 " + jsonObj.totalcnt + "건)");
		
		
		// 페이징 업데이트
		var pagination = buildPagination(jsonObj.writepages, jsonObj.totalpage, jsonObj.page, jsonObj.pagerows);
		$("#pagination").html(pagination);
		
		return true;
	} else {
		alert(jsonObj.message);
		return false;
	}
	return false;
} // end updateList()


function buildPagination(writePages, totalPage, curPage, pageRows){
	
	var str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성
	
	// 페이징에 보여질 숫자들 (시작숫자 start_page ~ 끝숫자 end_page)
    var start_page = ( (parseInt( (curPage - 1 ) / writePages ) ) * writePages ) + 1;
    var end_page = start_page + writePages - 1;

    if (end_page >= totalPage){
    	end_page = totalPage;
    }
    
  //■ << 표시 여부
	if(curPage > 1){
		str += "<li><a onclick='loadPage(1)' class='tooltip-top' title='처음'><i class='material-icons'>first_page</i></a></li>\n";
	}
	
  	//■  < 표시 여부
    if (start_page > 1) 
    	str += "<li><a onclick='loadPage(" + (start_page - 1) + ")' class='tooltip-top' title='이전'><i class='material-icons'>chevron_left</i></a></li>\n";
    
    //■  페이징 안의 '숫자' 표시	
	if (totalPage > 1) {
	    for (var k = start_page; k <= end_page; k++) {
	        if (curPage != k)
	            str += "<li><a onclick='loadPage(" + k + ")'>" + k + "</a></li>\n";
	        else
	            str += "<li><a class='active tooltip-top' title='현재페이지'>" + k + "</a></li>\n";
	    }
	}
	
	//■ > 표시
    if (totalPage > end_page){
    	str += "<li><a onclick='loadPage(" + (end_page + 1) + ")' class='tooltip-top' title='다음'><i class='material-icons'>chevron_right</i></a></li>\n";
    }

	//■ >> 표시
    if (curPage < totalPage) {
        str += "<li><a onclick='loadPage(" + totalPage + ")' class='tooltip-top' title='맨끝'><i class='material-icons'>last_page</i></a></li>\n";
    }

    return str;


	
} // end buildPagination()



function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function select(){
	$(":input:radio").click(function(){
		$("tr").removeClass("lightcyan");
		$("tr").removeClass("important");
		$(this).parents("tr").addClass("lightcyan");
		$(this).parents("tr").addClass("important");
	});
}




