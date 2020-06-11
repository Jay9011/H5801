<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="customModal1" class="ModalForm" style="display:none;">
	<div class="CustomModal">
		<div class="modalTitle">
			<h5 class="Title">제목이 없습니다.</h5>
			<p class="Context" class="left-align">내용이 없습니다.</p>
		</div>
		<div class="modalFooter">
			<a onclick="reloadPage(); return false;" class="waves-effect btn-flat amber">확인</a>
		</div>
	</div>
	<div class="modal-overlay" style="z-index: 1002; display: block; opacity: 0.5;"></div>
</div>

<div id="customModal2" class="ModalForm" style="display:none;">
	<div class="CustomModal">
		<div class="modalTitle">
			<h5 class="Title">제목이 없습니다.</h5>
			<p class="Context" class="left-align">내용이 없습니다.</p>
		</div>
		<div class="modalFooter">
			<a onclick="closeModal(this); return false;" class="waves-effect btn-flat amber">확인</a>
		</div>
	</div>
	<div class="modal-overlay" style="z-index: 1002; display: block; opacity: 0.5;"></div>
</div>

<div id="DeletePost" class="ModalForm" style="display:none;">
	<input id="s_uid" name="s_uid">
	<div class="CustomModal">
		<div class="modalTitle">
			<h5 class="Title">정말로 삭제하시겠습니까?</h5>
			<p class="Context" class="left-align">한 번 삭제하면 되돌릴 수 없습니다.<br>정말로 삭제하시겠습니까?</p>
		</div>
		<div class="modalFooter">
			<a onclick="chkDeleteOk(); return false;" class="waves-effect btn-flat amber">삭제</a>
			<a onclick="closeModal(this); return false;" class="waves-effect btn-flat amber">취소</a>
		</div>
	</div>
	<div class="modal-overlay" style="z-index: 1002; display: block; opacity: 0.5;"></div>
</div>

<div id="DeleteQuetion" class="ModalForm" style="display:none;">
	<input id="sr_uid" name="sr_uid">
	<div class="CustomModal">
		<div class="modalTitle">
			<h5 class="Title">정말로 삭제하시겠습니까?</h5>
			<p class="Context" class="left-align">한 번 삭제하면 되돌릴 수 없습니다.<br>정말로 삭제하시겠습니까?</p>
		</div>
		<div class="modalFooter">
			<a onclick="deleteCommentOk(); return false;" class="waves-effect btn-flat amber">삭제</a>
			<a onclick="closeModal(this); return false;" class="waves-effect btn-flat amber">취소</a>
		</div>
	</div>
	<div class="modal-overlay" style="z-index: 1002; display: block; opacity: 0.5;"></div>
</div>

<script>
	function openModal1(title, context){
		$("#customModal1 .Title").text(title);
		$("#customModal1 .Context").text(context);
		$("#customModal1").css({"display": "block"});
	}

	function openModal2(title, context){
		$("#customModal2 .Title").text(title);
		$("#customModal2 .Context").text(context);
		$("#customModal2").css({"display": "block"});
	}

	function closeModal(messenger){
		$(messenger).parents(".ModalForm").css({"display": "none"});
	}

	function reloadPage(){
		location.reload();
	}



</script>