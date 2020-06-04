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
<title>비밀번호 찾기</title>
<link href ="CSS/pw_default.css" rel="stylesheet" type="text/css">
</head>
<script>
function chkSubmit(){
	frm=document.forms['frm']; // 변수 정의: 현재 문서(document)의 'frm'이라는 form을 frm으로 정의
	var email= frm['email'].value.trim();
	
	if(email==""){ // 프런트엔드 변수 검즘 (제목은 필수), required로도 처리 가능
		alert("이메일은 반드시 입력해야 합니다");
		frm['email'].focus(); // cursor 포커스 옮겨주기
		return false; // submit 실패
	}
	return true; // submit 성공
}

</script>
<body>
    <div>
        <div class="div1">
            <h2 class="title">비밀번호 찾기</h2>
            <form name="frm" action="findPwOk.holic" method="post" onsubmit="return chkSubmit()">
            	<div>
            		<label>ID (이메일)</label>
                </div>
                <div>
                    <input type="email" name="email" placeholder="email 입력란" class= "email"/>
                </div>
	            <div class="div2">
	                <input type="submit" value="전송" class="btn_submit">
	            </div>
            </form>
        </div>
    </div>
</body>
</html>