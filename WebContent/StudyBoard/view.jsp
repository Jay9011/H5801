<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${empty viewInfo || fn:length(viewInfo) == 0 }">
		<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
		<jsp:include page="../modal.jsp" />
		<div id="demo-modal" class="modal">
			<div class="modal-content">
				<h5>접근 실패</h5>
				<p class="left-align">해당 정보가 삭제되었거나 존재하지 않습니다.</p>
			</div>
			<div class="modal-footer">
				<a href="javascript:window.history.back();" class="modal-close waves-effect  btn-flat amber">확인</a>
			</div>
		</div>
		<script>
			document.addEventListener('DOMContentLoaded', function () {
			    var Modalelem = document.querySelector('.modal');
			    var instance = M.Modal.init(Modalelem, {dismissible:false, preventScrolling:false});
			    instance.open();
			});
		</script>
	</c:when>
	<c:otherwise>
   <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/comment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/customModal.css">
<title>학습 문의 ${viewInfo[0].s_title}</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
		<div class="row">
			<div class="col m1 "></div>
			<div class="col s12 m10">
				<h3 class="center-align pfont">${viewInfo[0].s_title}</h3>

				<div class="row">
					<div class="col s12 pfont right-align">
						작성자 : ${viewInfo[0].m_nick}<br> ${viewInfo[0].s_date} <br>
					</div>
				</div>

				<div class="row">
					<div class="col s12 right-align">
						<c:if test="${uid != null}">
							<c:choose>
								<c:when test="${liked > 0 }">
									<button id="likeBtn" class="btn waves-effect btn3"
										onclick="favorite(${uid}, ${viewInfo[0].s_uid})">좋아요 취소 <i
										class="material-icons dp48">favorite</i></button>
								</c:when>
								<c:otherwise>
									<button id="likeBtn" class="btn waves-effect btn3"
										onclick="favorite(${uid}, ${viewInfo[0].s_uid})">좋아요 <i
										class="material-icons dp48">favorite_border</i></button>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${uid == viewInfo[0].m_uid }">
							<button class="btn waves-effect btn2"
								onclick="location.href = 'update.ho?s_uid=${viewInfo[0].s_uid}'">수정하기</button>
						</c:if>
						<c:if test="${uid == viewInfo[0].m_uid || grade > 8}">
							<button class="btn waves-effect btn2"
								onclick="chkDelete(${viewInfo[0].s_uid})">삭제하기</button>
						</c:if>
						<button class="btn waves-effect btn2"
							onclick="location.href = 'list.ho'">목록보기</button>
					</div>
				</div>

				<div class="row">
						<div class="col s12"
							style="margin-left: 5px; border-radius: 5px; border: 1px solid #ffa537;">
							<div style="padding: 5% 4% ">${viewInfo[0].s_content}</div>
						</div>
						<div class="col s1"></div>
					</div>


		<%-- 댓글이 --%>
		<h6 class="left-align pfont">댓글달기</h6>
<c:if test="${uid != null}">
	<form id="newComForm${viewInfo[0].s_uid }" name="commentTable" method="POST" enctype="multipart/form-data">
		<input id="bordUid" type="hidden" name="s_uid" value="${viewInfo[0].s_uid}" />
		<input id="memberUid" type="hidden" name="m_uid" value="${uid }" />
		<%-- 작성자: <input type="text" name="m_nick" value="${nick }" disabled="disabled"/><br> --%>
		<div class="row">
		<div class="col m10 s12" style="margin-right: auto; float: none;">
		<textarea id="editor1"></textarea>
		</div>
		<div class="col m10 offset-m1 s12 right-align">
		<button id="newComFormSubmit" type="button" class="btn waves-effect btn2" onclick="comSubmit('newComForm${viewInfo[0].s_uid }');">등록</button></div>
		</div>

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
		url: "commentJSON.ho?s_uid=" + ${viewInfo[0].s_uid}
		,type: "GET"
		,cache: false
		,success: function (data, status){
			if(status == "success") createComment(data);
		}
	});

	function chkDelete(s_uid){
		$("#DeletePost").css({"display": "block"});
		$("#DeletePost #s_uid").val(s_uid);
	}

	function chkDeleteOk(){
		var s_uid = $("#DeletePost #s_uid").val();
		location.href = 'deleteOk.ho?s_uid=' + s_uid;
	}

	var replyClick = false;
	function createComment(jsonObj, prevId){
		var commentrow = "";
		var row = jsonObj.data;
		initPage();
		if(row != null){
			for (var i = 0; i < row.length; i++) {
				var user_id = row[i].m_uid;
				var user_grade = 1;
				var logined_id = 0;
				if(${uid != null}){
					var logined_id = ${uid};
				}
				if(${grade != null}){
					var user_grade = ${grade};
				}
				commentrow += "<div style='clear:both;'></div>";
				if(row[i].sr_depth == 0){
					commentrow += "<div class='row'><div id='" + row[i].sr_numUid + "' class='depth" + row[i].sr_depth + " replyOn'>";
				} else {
					commentrow += "<div class='row'><div id='" + row[i].sr_numUid + "' class='depth" + row[i].sr_depth + "'>";
				}
				commentrow += "<div class='left pfont'><i class='material-icons dp48' style='vertical-align: middle;'>sentiment_satisfied</i> " +  row[i].m_nick + "</div>";

				if(user_id == logined_id || user_grade > 8){
					commentrow += "<div class='right'><a class='tooltipped orange-text text-darken-1' data-position='top' data-tooltip='삭제' onclick='event.stopPropagation(); deleteComment(" + row[i].sr_numUid + ");'><i class='material-icons dp48' style='vertical-align: middle;'>delete</i></a></div>";
				}
				if(user_id == logined_id){
					commentrow += "<div class='right'><a class='tooltipped orange-text text-darken-1' data-position='top' data-tooltip='수정'  style='border: none; width:' onclick='event.stopPropagation(); alterComment(" + row[i].sr_numUid + ")'><i class='material-icons dp48' style='vertical-align: middle;'>mode_edit</i></a></div>";
				}
				commentrow += "<div class='right pfont' style='margin-right: 3%;'>" + row[i].sr_date + " </div>";
				commentrow += "<div class='clear'></div>";
				commentrow += "<div style='margin-left: 5px; border-radius: 5px; border: 1px solid #ff8e04; padding: 0 4%;'>" + row[i].sr_com + "</div>";
				commentrow += "</div></div>";
			}
			if(typeof prevId == "undefined"){
				$("#commentList").prepend(commentrow);
			} else {
				$("#" + prevId).after(commentrow);
			}
		     $('.tooltipped').tooltip({
		    	 margin:3
		     });
			$(".replyOn").unbind('click').bind('click', function(){
				if($(this).next().attr("id") == "addReply" && replyClick == false){
					initPage();
				} else {
					replyClick = true;
					initPage();
					$(".cke_editor_editor2").remove();
					if(${uid != null}){
						var commentrow = "";
						commentrow += "<form id='addReply' class='col s12 m10' name='commentTable' method='POST' enctype='multipart/form-data' style='margin-right: auto; float: none;'>";
						commentrow += "<input id='parent' type='hidden' name='parent_uid' value='" + $(this).attr('id') + "' />";
						commentrow += "<input id='bordUid' type='hidden' name='s_uid' value='${viewInfo[0].s_uid}' />";
						commentrow += "<input id='memberUid' type='hidden' name='m_uid' value='${uid }' />";
	// 					commentrow += "작성자: <input type='text' name='m_nick' value='${nick }' disabled='disabled'/><br>";
						commentrow += "<textarea id='editor2'></textarea>";
						commentrow += "<div class='col s12 right-align'><button class='btn waves-effect btn2' id='addReplySubmit' type='button' onclick='comSubmit(\"addReply\");'>댓글 달기</button></div> ";
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
					createComment(data, prevId);
					CKEDITOR.instances.editor1.setData('');
				} else if(data.status == "FAIL"){
					openModal2("등록 실패", "등록 실패 : " + data.message);
				}
			}
			,error: function(e){
				console.log("ERROR : ", e);
                alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}

	function deleteComment(sr_uid){
		$("#DeleteQuetion").css({"display": "block"});
		$("#DeleteQuetion #sr_uid").val(sr_uid);
	}

	function deleteCommentOk(){
		var sr_uid = $("#DeleteQuetion #sr_uid").val();
		$("#DeleteQuetion").css({"display": "none"});
		$.ajax({
			type:"POST"
			,url:"comDeleteOk.ho?sr_uid=" + sr_uid
			,dataType:"json"
			,processData:false
			,contentType:false
			,cache:false
			,success: function(data){
				if(data.status == "OK"){
					openModal1("삭제 성공", "정상적으로 삭제되었습니다.");
					/* $("#" + sr_uid).remove(); */
					/* location.reload(); */
				} else if(data.status == "FAIL"){
					openModal2("삭제 실패", "삭제를 실패했습니다. 잠시 후 다시 시도해 주세요.");
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
// 					commentrow += "작성자: <input type='text' name='m_nick' value='" + data[0].m_nick + "' disabled='disabled'/><br>";
					commentrow += "<textarea id='editor2'>" + data[0].sr_com +"</textarea>";
					commentrow += "<button id='addReplySubmit' class='btn waves-effect btn2' type='button' onclick='alterCommentOk(\"addReply\", " + data[0].sr_numUid + ")'>수정</button>";
					commentrow += "<button id='addReplySubmit' class='btn waves-effect btn2' type='button' onclick='initPage();'>취소</button>";
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
					openModal1("수정 성공", "정상적으로 수정되었습니다.");
				} else if(data.status == "FAIL"){
					openModal2("수정 실패", "수정을 실패했습니다.");
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
						$("#likeBtn").html("좋아요 <i class='material-icons dp48'>favorite_border</i>");
					} else if (data.isClicked == 1){
						$("#likeBtn").html("좋아요 취소 <i class='material-icons dp48'>favorite</i>");
					}
				} else if(data.status == "FAIL"){
					alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
				}
			}
			,error: function(e){
				console.log("ERROR : ", e);
                alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}
</script>
</div>
			<div class="col m1"></div>
		</div>

</section>
	<jsp:include page="modalForms.jsp"/>
	<jsp:include page="../foot.jsp"/>
</body>
</html>
	</c:otherwise>
</c:choose>