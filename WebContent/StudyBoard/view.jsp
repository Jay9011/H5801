<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${empty viewInfo || fn:length(viewInfo) == 0 }">
		<script>
			alert("해당 정보가 삭제되었거나 존재하지 않습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>읽기 ${viewInfo[0].s_title}</title>
<script src="../ckeditor/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.right {
		float:right;
	}
	.left {
		float:left;
	}
	.clear {
		clear:both;
	}
	.depth1 {
		margin-left: 50px;
	}
	.hidden {
		display: none;
	}
</style>
</head>
<script>
function chkDelete(s_uid){
	var r = confirm("정말로 삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.ho?s_uid=' + s_uid;
	} else {

	}
}
function chkSubmit(){
	frm = document.forms["commentTable"];
	var content = frm["content"].value.trim();

	if(CKEDITOR.instances.editor1.getData() == ""
		|| CKEDITOR.instances.editor1.getData().length == 0){
		alert("내용을 입력해 주세요.");
		frm["content"].focus();
		return false;
	}
	return true;
}
</script>
<body>
<h2>읽기 ${viewInfo[0].s_title}</h2>
<br>
작성자 : ${viewInfo[0].m_nick}<br>
제목 : ${viewInfo[0].s_title}<br>
등록일 : ${viewInfo[0].s_date}<br>
조회수 : ${viewInfo[0].s_viewCnt}<br>
<hr>
내용 : <br>
<div>
${viewInfo[0].s_content}
</div>
<hr>
<br>
<c:if test="${uid != null}">
	<c:choose>
		<c:when test="${liked > 0 }">
			<button id="likeBtn" onclick="favorite(${uid}, ${viewInfo[0].s_uid})">좋아요 취소</button>
		</c:when>
		<c:otherwise>
			<button id="likeBtn" onclick="favorite(${uid}, ${viewInfo[0].s_uid})">좋아요</button>
		</c:otherwise>
	</c:choose>
</c:if>
<button onclick="location.href = 'list.ho'">목록보기</button>
<c:if test="${uid == viewInfo[0].m_uid }">
	<button onclick="location.href = 'update.ho?s_uid=${viewInfo[0].s_uid}'">수정하기</button>
</c:if>
<c:if test="${uid == viewInfo[0].m_uid || grade > 8}">
	<button onclick="chkDelete(${viewInfo[0].s_uid})">삭제하기</button>
</c:if>
<c:if test="${uid != null}">
	<button onclick="location.href = 'write.ho'">글쓰기</button>
</c:if>
<hr />
<c:if test="${uid != null}">
	<form id="newComForm${viewInfo[0].s_uid }" name="commentTable" method="POST" enctype="multipart/form-data">
		<input id="bordUid" type="hidden" name="s_uid" value="${viewInfo[0].s_uid}" />
		<input id="memberUid" type="hidden" name="m_uid" value="${uid }" />
		작성자: <input type="text" name="m_nick" value="${nick }" disabled="disabled"/><br>
		<br><textarea id="editor1"></textarea>
		<br><input id="newComFormSubmit" type="button" value="등록" onclick="comSubmit('newComForm${viewInfo[0].s_uid }');"/>
	</form>
</c:if>
<div id="commentList">

</div>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true
		,filebrowserUploadUrl: '${pageContext.request.contextPath}/StudyBoard/fileUpload.ho'
	});

	$.ajax({
		url:"commentJSON.ho?s_uid=" + ${viewInfo[0].s_uid}
		, type:"GET"
		, cache: false
		, success: function (data, status){
			if(status == "success") createComment(data);
		}
	});

	var replyClick = false;
	function createComment(jsonObj, prevId){
		var commentrow = "";
		var row = jsonObj.data;
		initPage();
		for (var i = 0; i < row.length; i++) {
			var user_id = row[i].m_uid;
			var user_grade = 1;
			var logined_id = 0;
			<c:if test="${uid != null}">
				var logined_id = ${uid};
			</c:if>
			<c:if test="${grade != null}">
				var user_grade = ${grade};
			</c:if>
			if(row[i].sr_depth == 0){
				commentrow += "<div id='" + row[i].sr_numUid + "' class='depth" + row[i].sr_depth + " replyOn'>"
			} else {
				commentrow += "<div id='" + row[i].sr_numUid + "' class='depth" + row[i].sr_depth + "'>"
			}
			commentrow += "<div class='left'>" + row[i].m_nick + "</div>"
			if(user_id == logined_id || user_grade > 8){
				commentrow += "<div class='right'><button onclick='event.stopPropagation(); deleteComment(" + row[i].sr_numUid + ");'>삭제</button></div>"
			}
			if(user_id == logined_id){
				commentrow += "<div class='right'><button onclick='event.stopPropagation(); alterComment(" + row[i].sr_numUid + ")'>수정</button></div>"
			}
			commentrow += "<div class='right'>" + row[i].sr_date + "</div>"
			commentrow += "<div class='clear'></div>"
			commentrow += "<div>" + row[i].sr_com + "</div>"
			commentrow += "</div>"
		}
		if(typeof prevId == "undefined"){
			$("#commentList").prepend(commentrow);
		} else {
			$("#" + prevId).after(commentrow);
		}
		$(".replyOn").unbind('click').bind('click', function(){
			if($(this).next().attr("id") == "addReply" && replyClick == false){
				initPage();
			} else {
				replyClick = true;
				initPage();
				$(".cke_editor_editor2").remove();
				if(${uid != null}){
					var commentrow = "";
					commentrow += "<form id='addReply' name='commentTable' method='POST' enctype='multipart/form-data'>";
					commentrow += "<input id='parent' type='hidden' name='parent_uid' value='" + $(this).attr('id') + "' />";
					commentrow += "<input id='bordUid' type='hidden' name='s_uid' value='${viewInfo[0].s_uid}' />";
					commentrow += "<input id='memberUid' type='hidden' name='m_uid' value='${uid }' />";
					commentrow += "작성자: <input type='text' name='m_nick' value='${nick }' disabled='disabled'/><br>";
					commentrow += "<br><textarea id='editor2'></textarea>";
					commentrow += "<br><input id='addReplySubmit' type='button' value='등록' onclick='comSubmit(\"addReply\");'/>";
					commentrow += "</form>";
					$(this).after(commentrow);
					CKEDITOR.replace('editor2', {
						allowedContent: true
						,toolbar: [
						['Styles','Format','Font','FontSize'],
						['Bold','Italic','Strike'],
						['TextColor','BGColor'],
						['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
						['Link','Unlink'],
						]
						});
				}
				replyClick = false;
			}
		});
	}

	function comSubmit(frmid){
		var form = $('#' + frmid)[0];
		var data = new FormData(form);
		var prevId = $('#' + frmid).prev().attr("id");
		if(frmid == 'addReply'){
			data.append('content', CKEDITOR.instances['editor2'].getData());
		} else {
			data.append('content', CKEDITOR.instances['editor1'].getData());
		}

		$.ajax({
			type:"POST"
			,url:"commentOk.ho"
			,data: data
			,dataType: "json"
			,processData:false
			,contentType:false
			,cache:false
			,success: function(data){
				if(data.status == "OK"){
					alert("등록 성공");
					createComment(data, prevId);
					CKEDITOR.instances.editor1.setData('');
				} else if(data.status == "FAIL"){
					alert("등록 실패");
				}
			}
			,error: function(e){
				console.log("ERROR : ", e);
                alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}

	function deleteComment(sr_uid){
		$.ajax({
			type:"POST"
			,url:"comDeleteOk.ho?sr_uid=" + sr_uid
			,dataType:"json"
			,processData:false
			,contentType:false
			,cache:false
			,success: function(data){
				if(data.status == "OK"){
					alert("삭제 성공");
					/* $("#" + sr_uid).remove(); */
					location.reload();
				} else if(data.status == "FAIL"){
					alert("삭제 실패. ");
				}
			}
			,error: function(e){
				console.log("ERROR : ", e);
                alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}

	function alterComment(sr_uid){
		$.ajax({
			type:"POST"
			,url:"comUpdate.ho?sr_uid=" + sr_uid
			,dataType:"json"
			,processData:false
			,contentType:false
			,cache:false
			,success: function(data){
				if(data.status == "OK"){
					initPage();
					var data = data.data;
					var commentrow = "";
					commentrow += "<form id='addReply' name='commentTable' method='POST' enctype='multipart/form-data'>";
					commentrow += "<input id='commentUid' type='hidden' name='sr_uid' value='" + data[0].sr_numUid + "' />";
					commentrow += "<input id='memberUid' type='hidden' name='m_uid' value='" + data[0].m_uid + "' />";
					commentrow += "작성자: <input type='text' name='m_nick' value='" + data[0].m_nick + "' disabled='disabled'/><br>";
					commentrow += "<br><textarea id='editor2'>" + data[0].sr_com +"</textarea>";
					commentrow += "<br><input id='addReplySubmit' type='button' value='수정' onclick='alterCommentOk(\"addReply\", " + data[0].sr_numUid + ")'/>";
					commentrow += "<br><input id='addReplySubmit' type='button' value='취소' onclick='initPage();'/>";
					commentrow += "</form>";
					$("#" + sr_uid).addClass('hidden')
					$("#" + sr_uid).after(commentrow);
					if(data[0].sr_depth == 0){
						CKEDITOR.replace('editor2', {
							allowedContent: true
							,filebrowserUploadUrl: '${pageContext.request.contextPath}/StudyBoard/fileUpload.ho'
							});
					} else {
						CKEDITOR.replace('editor2', {
							allowedContent: true
							,toolbar: [
							['Styles','Format','Font','FontSize'],
							['Bold','Italic','Strike'],
							['TextColor','BGColor'],
							['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
							['Link','Unlink'],
							]
							});
					}
				} else if(data.status == "FAIL"){
					alert("데이터를 가져오는데 실패했습니다. 다시 시도해 주세요.");
				}
			}
			,error: function(e){
				console.log("ERROR : ", e);
                alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}

	function alterCommentOk(frmid, sr_uid){
		var form = $('#' + frmid)[0];
		var data = new FormData(form);
		data.append('content', CKEDITOR.instances['editor2'].getData());

		$.ajax({
			type:"POST"
			,url:"comUpdateOk.ho?sr_uid=" + sr_uid
			,data: data
			,dataType:"json"
			,processData:false
			,contentType:false
			,cache:false
			,success: function(data){
				if(data.status == "OK"){
					alert("수정 성공");
					location.reload();
				} else if(data.status == "FAIL"){
					alert("수정 실패. ");
				}
			}
			,error: function(e){
				console.log("ERROR : ", e);
                alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}

	function initPage() {
		$("#addReply").remove();
		$(".cke_editor_editor2").remove();
		$(".hidden").removeClass("hidden")
	}

	function favorite(m_uid, s_uid){
		$.ajax({
			type:"POST"
			,url:"favor.ho"
			,data: {
				'm_uid' : m_uid
				,'s_uid' : s_uid
			}
			,dataType:"json"
			,success: function(data){
				if(data.status == "OK"){
					if(data.isClicked == 0){
						$("#likeBtn").text("좋아요");
					} else if (data.isClicked == 1){
						$("#likeBtn").text("좋아요 취소");
					}
				} else if(data.status == "FAIL"){
					alert("등록 실패");
				}
			}
			,error: function(e){
				console.log("ERROR : ", e);
                alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}
</script>
</body>
</html>
	</c:otherwise>
</c:choose>