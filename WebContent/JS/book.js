var page= 1; // 현재 페이지
var pageRows = 5; // 한 페이지에 보여지는 게시글 개수
var uid = 4;

$(document).ready(function(){
	// 게시판 목록 1페이지 로딩
	loadPage(page);
});

//page 번째 페이지 로딩
function loadPage(page){
	
	$.ajax({
		url : "book2.ajax?uid="+uid +"&page=" + page + "&pageRows=" + pageRows
		, type : "GET"
		, cache : false
		, success : function(data, status){
			if(status == "success"){
				//alert("AJAX 성공: 받아쮸~");
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
		window.pageRows = jsonObj.pageRows;
		
		var i;
		var items = jsonObj.data;   // 배열
		for(i = 0; i < count; i++){
			result += "<tr>\n";
			result += "<td>" + items[i].rnum + "</td>\n";
			result += "<td>" + items[i].b_seatType + "</td>\n";
			result += "<td>" + items[i].b_sdate + "</td>\n";
			result += "<td>" + items[i].b_term + "</td>\n";
			result += "<td>" + items[i].m_nick + "</td>\n";
			result += "<td>" + items[i].total_amount + "</td>\n";			
			result += "<td>" + items[i].p_cancel + "</td>\n";			
			result += "<td>" + items[i].p_uid + "</td>\n";			
			result += "</tr>\n";
		} // end for
		$("#list tbody").html(result);  // 테이블 업데이트!
		
		// 페이지 정보 업데이트
		$("#pageinfo").text(jsonObj.page + "/" + jsonObj.totalPage + "페이지, " + jsonObj.totalCnt + "개의 글");
		
		// pageRows
		var txt = "<select id='rows' onchange='changePageRows()'>\n";
		txt += "<option " + ((window.pageRows == 10)?"selected":"") + " value='10'>10개씩</option>\n";
		txt += "<option " + ((window.pageRows == 20)?"selected":"") + " value='20'>20개씩</option>\n";
		txt += "<option " + ((window.pageRows == 50)?"selected":"") + " value='50'>50개씩</option>\n";
		txt += "<option " + ((window.pageRows == 100)?"selected":"") + " value='100'>100개씩</option>\n";		
		txt += "</select>\n";
		$("#pageRows").html(txt);
		
		
		// 페이징 업데이트
		var pagination = buildPagination(jsonObj.writePages, jsonObj.totalPage, jsonObj.page, jsonObj.pageRows);
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
		str += "<li><a onclick='loadPage(1)' class='tooltip-top' title='처음'><i class='fas fa-angle-double-left'></i></a></li>\n";
	}
	
  	//■  < 표시 여부
    if (start_page > 1) 
    	str += "<li><a onclick='loadPage(" + (start_page - 1) + ")' class='tooltip-top' title='이전'><i class='fas fa-angle-left'></i></a></li>\n";
    
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
    	str += "<li><a onclick='loadPage(" + (end_page + 1) + ")' class='tooltip-top' title='다음'><i class='fas fa-angle-right'></i></a></li>\n";
    }

	//■ >> 표시
    if (curPage < totalPage) {
        str += "<li><a onclick='loadPage(" + totalPage + ")' class='tooltip-top' title='맨끝'><i class='fas fa-angle-double-right'></i></a></li>\n";
    }

    return str;


	
} // end buildPagination()


function changePageRows(){
	window.pageRows = $("#rows").val();
	loadPage(window.page);
}
