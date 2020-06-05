<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-01  21:00 수정
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<jsp:include page="../top.jsp"/>
<title>FIND YOUR PASSWORD</title>
</head>

<script>

function chkEmailSubmit() {
	var frm = document.findPwFrm;
	
	var email = frm.email.value.trim();
	var emailPat = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	 document.getElementById("chkid").innerHTML = "";
     
	if(email == ""){
		document.getElementById("chkid").innerHTML = "이메일을 써주세요";                                    
	    frm.email.focus();
        return false;
	}
	
	if(!emailPat.test(email)){
		   document.getElementById("chkid").innerHTML = "잘못된 email 입니다";                         
		   frm.email.focus();
           return false;
	}
	
	
	
	frm.submit();
}  

</script>
<body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
<section class="container section scrollspy" id="intro">
	 <div class="row">
		<div class="col s12 14">
			<h1 class="center-align pfont">FIND YOUR PASSWORD</h1>
            <form name="findPwFrm" action="${pageContext.request.contextPath}/User/findPwOk.ho" method="post" >
            	<div class="row">
					<div class="col s1 "></div>
					<div class="input-field col s10 ">
                    	<input id="email_inline" type="email" name="email" class= "validate"/>
            			<label for="email_inline">이메일(아이디)</label>
                 		<span id="chkid" class="helper-text"></span>
                 	</div>
                 	<div class="col s1 "></div>
                 </div>
			</form>
			<div class="row">
				<div class="col s12 14 center-align">
	                <button type="button" class="btn waves-effect" onclick="chkEmailSubmit()">확인</button>
	             </div>
          	</div>
		</div>
	</div>
</section>
<jsp:include page="../foot.jsp"/>
</body>
</html>