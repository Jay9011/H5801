<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JOIN</title>
</head>
<!-- 주소 API  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
    // 핸드폰 숫자만 나오게 한후 -생성
    $(document).on("keyup", "#phoneNum", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^01.{1})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
    // 생년월일 숫자만 나오게 한후 -생성
    $(document).on("keyup", "#birth", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/,'$1-$2-$3').replace("--", "-")); });
  
    // 주소 API
    function exeAddress(){
        new daum.Postcode({
            oncomplete: function(data) { 
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

            // 주소
            document.getElementById("addressA").value = addr;
            // 상세주소
            document.getElementById("addressB").focus();
            }
        }).open();
    }

   function joinSubmit(){
        var frm = document.joinFrm;
        //아이디 정규식
	    var idJ = /^[a-z0-9]{4,12}$/;
	    // 비밀번호 정규식
	    var pwJ = /^[A-Za-z0-9]{4,12}$/; 
        // 이름 정규식
	    var nameJ = /^[가-힣]{2,6}$/;
       // 이메일 검사 정규식
	    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        // 휴대폰 번호 정규식
        var phoneJ = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
        // 생년월일
        var birth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
   }
   
   var checkFirst = false;
   var lastKeyword = '';
   var loopSendKeyword = false;
   
  function checkid() {
	  if (checkFirst == false) {
		   //0.5초 후에 sendKeyword()함수 실행
		   setTimeout("sendId()", 500);
		   loopSendKeyword = true;
		  }
		  checkFirst = true;
}
  function sendId() {
	  if (loopSendKeyword == false) return;
	  
	  var keyword = document.joinFrm.nick.value;
	  if (keyword == '') {
	   lastKeyword = '';
	   document.getElementById('chkNick').style.color = "black";
	   document.getElementById('chkNick').innerHTML = "아이디를 입력하세요.";
	  } else if (keyword != lastKeyword) {
	   lastKeyword = keyword;
	   
	   if (keyword != '') {
	    var params = "nick="+encodeURIComponent(keyword);
	    sendRequest("id_check.ho", params, displayResult(), 'POST');
	   } else {
	   }
	  }
	  setTimeout("sendId();", 500);
	 }
  function displayResult() {
	  var httpRequest = new XMLHttpRequest();
	  var chkNick = document.getElementById("chkNick");
		httpRequest.onreadystatechange = function() {
			if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
				if(httpRequest.responseText == 0){
					chkNick.innerHTML = "사용할 수 있는 아이디 입니다."
				}else{
					chkNick.innerHTML = "사용할 수 없는 아이디 입니다."
				}
			}
		}
	}//checkid() end
  
  
  
  
</script>
<body>
<%
String agree1 = request.getParameter("agree1");
String agree2 = request.getParameter("agree2");

if(agree1 == null || agree2 == null){%>
<script>
location.href="joinchk.ho";
</script>
<%} else{%>
<h1>회원가입</h1>
<form action="joinOk.ho" name="joinFrm" method="post">
<p>이름 : <input type="text" name="name" id="name"></p>
<p>닉네임 : <input type="text"name="nick" id="nick" onkeydown="checkid();"></p>
<p id="chkNick"></p>
<p>이메일: <input type="email" name="email" id="email"/></p>
<p>비밀번호 : <input type="password" name="pw" id="pw"> 비밀번호 확인: <input type="password" name="pwchk" id="pwchk" onkeyup="checkPwd()"></p>
<p>생년월일 : <input type="text" name="birth" id="birth" maxlength="10" > 성별 : <label >남자<input type="radio" name="gender" value="남자" checked></label> 
    <label>여자<input type="radio" name="gender" value="여자"></label></p>
    <p>핸드폰 : <input type="tel" name="phoneNum" id="phoneNum" maxlength="13"> sms 수신여부 <label>동의<input type="radio" name="smsok" value="1" checked></label> 
<label>비동의<input type="radio" name="smsok" value="0"></label></p>
<p>주소 : <input type="text" name="addressA" id="addressA" placeholder="주소" readonly onclick="exeAddress();"/> <input type="text" name="addressB" id="addressB" placeholder="상세주소"></p>

</form>
<button type="button" onclick="joinSubmit()">회원가입</button>
<%} %>
</body>
</html>