<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-05  01:00 수정
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when	test="${keyCode != null && uid != 0 }">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<jsp:include page="../top.jsp"/>
<title>RESET YOUR PASSWORD</title>
</head>
<script>
window.history.forward();
function blockBack(){window.history.forward();}

function chkKeyCodeSubmit(){
	var frm = document.resetPwFrm;
	var chkKeyCode = frm.chkKeyCode.value.trim();
	var resetPw = frm.resetPw.value.trim();
	var confirmPw = frm.confirmPw.value.trim();
    // 비밀번호 정규식
    var pwJ = /^[A-Za-z0-9]{4,12}$/; 

	document.getElementById("chkKeyCode").innerHTML = "";
	if(chkKeyCode == ""){
			document.getElementById("chkKeyCode").innerHTML = "인증번호를 써주세요";                                    
		    frm.chkKeyCode.focus();
	        return false;
		}
	 
	if(resetPw == ""){
		  document.getElementById("chkpw1").innerHTML = "비밀번호를 써주세요";      
		  frm.resetPw.focus();
	      return false;
	}
	
	if(!pwJ.test(resetPw)){
		document.getElementById("chkpw1").innerHTML = "비밀번호는 영어(대소문자), 숫자만 가능합니다. 4이상 12까지";
		frm.resetPw.focus();
		return false;	
	}
	
	if(confirmPw == ""){
		  document.getElementById("chkpw2").innerHTML = "비밀번호 확인을 해주세요";      
		  frm.confirmPw.focus();
	      return false;
	}
	
	if(resetPw != confirmPw){
		  document.getElementById("chkpw2").innerHTML = "비밀번호가 일치하지 않습니다";      
		  frm.confirmPw.focus();
	      return false;
	}
	

	frm.submit(); // submit 성공
}

</script>
<body onload="blockBack()" onpageshow="if(event.persisted) blockBack();" onunload="">
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s12 14">
            <h1 class="center-align pfont">RESET YOUR PASSWORD</h1>
            <form name="resetPwFrm" action="${pageContext.request.contextPath}/User/resetPwOk.ho" method="post">
            <input type="hidden" name="uid" value="${select_arr[0].uid}"/> <!-- parameter 넘길 때 자주 사용 -->
				<div class="row">
					<div class="col s1 "></div>
					<div class="input-field col s10 ">
						<input id="email_inline" type="text" name="chkKeyCode" class="validate">
						<label for="email_inline">인증번호</label>
						<span id="chkKeyCode" class="helper-text"></span>
					</div>
					<div class="col s1 "></div>
				</div>
            	<div class="row">
					<div class="col s1 "></div>
					<div class="input-field col s10 ">
						<input id="password" type="password" name="resetPw" class="validate" minlength="4">
						<label for="password">새 비밀번호</label>
						<span id="chkpw1" class="helper-text"></span>
					</div>
					<div class="col s1 "></div>
				</div>
            	<div class="row">
					<div class="col s1 "></div>
					<div class="input-field col s10 ">
						<input id="password" type="password" name="confirmPw" class="validate" minlength="4">
						<label for="password">비밀번호 확인</label>
						<span id="chkpw2" class="helper-text"></span>
					</div>
					<div class="col s1 "></div>
				</div>
			</form>
			<div class="row">
				<div class="col s12 14 center-align">
					<button type="button" class="btn waves-effect " onclick="chkKeyCodeSubmit()">확인</button>
				</div>
			</div>
        </div>
    </div>
</section>
<jsp:include page="../foot.jsp"/>
</body>
</html>
	</c:when>
	<c:when test="${empty select_arr || fn:length(select_arr) ==0 }">
	
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			location.href = "${pageContext.request.contextPath}/User/findPw.ho";
		</script>
	
	</c:when>
	<c:otherwise>
	
		<script>
			alert("잘못된 접근입니다. 이메일을 입력해주세요.")
			location.href = "${pageContext.request.contextPath}/User/findPw.ho";
		</script>
		
	</c:otherwise>
</c:choose>