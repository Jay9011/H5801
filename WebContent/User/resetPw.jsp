<%-- 비밀번호 변경 --%>
<%-- 
  작성자: 낙경
 2020-06-01  23:00 수정
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${empty select_arr || fn:length(select_arr) ==0 }">
	
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	
	</c:when>
	<c:otherwise>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href ="../CSS/pw_default.css" rel="stylesheet" type="text/css">
</head>
<script>
function chkSubmit(){
	frm=document.forms['frm']; // 변수 정의: 현재 문서(document)의 'frm'이라는 form을 frm으로 정의
	var chkKeyCode= frm['chkKeyCode'].value.trim();
	var resetPw= frm['resetPw'].value.trim();
	var confirmPw= frm['confirmPw'].value.trim();
	
	if(chkKeyCode==""){ // 프런트엔드 변수 검즘 (제목은 필수), required로도 처리 가능
		alert("인증번호는 반드시 입력해야 합니다");
		frm['chkKeyCode'].focus(); // cursor 포커스 옮겨주기
		return false; // submit 실패
	}
	if(resetPw==""){ // 프런트엔드 변수 검즘 (제목은 필수), required로도 처리 가능
		alert("비밀번호는 반드시 입력해야 합니다");
		frm['resetPw'].focus(); // cursor 포커스 옮겨주기
		return false; // submit 실패
	}
	if(confirmPw==""){ // 프런트엔드 변수 검즘 (제목은 필수), required로도 처리 가능
		alert("비밀번호 확인란은 반드시 입력해야 합니다");
		frm['confirmPw'].focus(); // cursor 포커스 옮겨주기
		return false; // submit 실패
	}
	if(frm['resetPw'].value.trim() != frm['confirmPw'].value.trim()){
        alert("※ 비밀번호 불일치: 비밀번호가 일치하지 않습니다");
        frm['confirmPw'].focus();
        return false;
    }
	return true; // submit 성공
}

</script>
<body>
    <div>
        <div class="div1">
            <h2 class="title">비밀번호 변경</h2>
            <form name="frm" action="resetPwOk.holic" method="post" onsubmit="return chkSubmit()">
            <input type="hidden" name="uid" value="${select_arr[0].getUid()}"/> <!-- parameter 넘길 때 자주 사용 -->
            	<div>
            		<label>인증번호</label>
                </div>
                <div>
                    <input type="text" name="chkKeyCode" placeholder="인증번호 입력란" class= "chkKeyCode"/>
                </div>
                <div>
            		<label>새 비밀번호</label>
                </div>
                <div>
                    <input type="text" name="resetPw" placeholder="새 비밀번호 입력" class= "resetPw"/>
                </div>
                <div>
            		<label>비밀번호 확인</label>
                </div>
                <div>
                    <input type="text" name="confirmPw" placeholder="비밀번호 확인" class= "confirmPw"/>
                </div>
	            <div class="div2">
	                <input type="submit" value="전송" class="btn_submit">
	            </div>
            </form>
        </div>
    </div>
</body>
</html>


</c:otherwise>
</c:choose>