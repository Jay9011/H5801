/**
 *  유효성 검사
 */
function joinmit(){
    var frm = document.joinFrm;
    //닉네임 정규식
    var nickJ = /^[가-힣A-z0-9]{3,8}$/;
    // 비밀번호 정규식
    var pwJ = /^[A-Za-z0-9]{4,12}$/; 
    // 이름 정규식
    var nameJ = /^[가-힣]{2,9}$/;
    // 휴대폰 번호 정규식
    var phoneJ = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
    // 생년월일
    var birthJ = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
    var name = frm.name.value.trim();
    var nick = frm.nick.value.trim();
	var pw = frm.pw.value.trim();
	var pwchk = frm.pwchk.value.trim();
	var birth = frm.birth.value.trim();
	var phoneNum = frm.phoneNum.value.trim();
	var addressA = frm.addressA.value.trim();
	var gender = frm.gender.checked;
	var smsOk = frm.smsok.value.checked;
	
	var cName = document.getElementById("chkName");    
	var cNick = document.getElementById("chkNick");  
	var cPw = document.getElementById("chkPW");
	var cBrith = document.getElementById("chkBirth");
	var cPhone = document.getElementById("chkPhone");
	var cAddr = document.getElementById("chkAddr");
	
	cName.innerHTML = "";
	cNick.innerHTML = "";
	cPw.innerHTML = "";
	cBrith.innerHTML = "";
	cPhone.innerHTML = "";
	cAddr.innerHTML = "";
	
	if(name == ""){
		cName.innerHTML =  "한글로 이름을 써주세요";                                    
	    frm.name.focus();
        return false;	
	}
	if(!nameJ.test(name)){
		cName.innerHTML =  "이름을 정확히 써주세요";        
		 frm.name.focus();
	     return false;	
	}
	
	if(nick == "" || !nickJ.test(nick)){
		cNick.innerHTML ="닉네임을 써주세요 닉네임은 한글 숫자 영어만 가능합니다. 4-8 글자";                                    
	    frm.nick.focus();
        return false;	
	}
	if(pw == ""){
		cPw.innerHTML = "비밀번호를 써주세요";
		   frm.pw.focus();
		   return false;	
	}
	if(!pwJ.test(pw)){
		cPw.innerHTML = "비밀번호는 영어(대소문자), 숫자만 가능합니다. 4이상 12까지";
		   frm.pw.focus();
		   return false;	
	}
	if(pwchk == ""){
		cPw.innerHTML = "비밀번호 확인을 해주세요";
		   frm.pw.focus();
		   return false;	
	}
	if(pw != pwchk){
		cPw.innerHTML = "기존 비밀번호와 다름니다";
		   frm.pwchk.focus();
		   return false;	
	}
	
	if(birth == "" || !birthJ.test(birth)){
		cBrith.innerHTML = "생년월일 8자리를입력해주세요";
		   frm.birth.focus();
		   return false;	
	}

	if(phoneNum == "" || !phoneJ.test(phoneNum)){
		cPhone.innerHTML = "정확한핸드폰 번호를 입력해 주세요";
		frm.phoneNum.focus();
		return false;	
	}
	if(addressA == ""){
		cAddr.innerHTML = "주소를 입력해주세요";
		frm.addressA.focus();
		return false;	
	}
	 frm.submit();
}
function chkSubmit() {
	var frm = document.loginFrm;
	
	var email = frm.email.value.trim();
	var pw = frm.pw.value.trim();
	 // 이메일 검사 정규식
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 document.getElementById("chkid").innerHTML = "";
     document.getElementById("chkpw").innerHTML = "";
     
	if(email == ""){
		document.getElementById("chkid").innerHTML = "이메일을 써주세요";                                    
	    frm.email.focus();
        return false;
	}
	
	if(!mailJ.test(email)){
		   document.getElementById("chkid").innerHTML = "잘못된 email 입니다";                         
		   frm.email.focus();
           return false;
	}
	
	if(pw == ""){
		  document.getElementById("chkpw").innerHTML = "비밀번호를 써주세요";      
		  frm.email.focus();
	      return false;
	}
	frm.submit();
}  // end loginsubmit()



function joinChk() {
    var frm = document.joinChkFrm;
    var agree1 = frm.agree1.checked;
    var agree2 = frm.agree2.checked;
    document.getElementById("agreechk").innerHTML = "";
    if(!agree1 || !agree2){
        document.getElementById("agreechk").innerHTML = "모든 약관에 체크해 주세요";
        return false;
    }
   frm.submit();
}// end joinChk()

// 회원수정
function reInfomit(){
    var frm = document.reInfoFrm;
    //닉네임 정규식
    var nickJ = /^[가-힣A-z0-9]{3,12}$/;
    // 비밀번호 정규식
    var pwJ = /^[A-Za-z0-9]{4,12}$/; 
 
    var phoneJ = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
    
    var nick = frm.nick.value.trim();
	var pw = frm.pw.value.trim();
	var pwchk = frm.pwchk.value.trim();
	var phoneNum = frm.phoneNum.value.trim();
	var addressA = frm.addressA.value.trim();
	var smsOk = frm.smsok.value.checked;
	
	
	var cNick = document.getElementById("chkNick");  
	var cEmail = document.getElementById("chkEmail");
	var cPw = document.getElementById("chkPW");
	var cPhone = document.getElementById("chkPhone");
	var cAddr = document.getElementById("chkAddr");
	cNick.innerHTML = "";
	cPw.innerHTML = "";
	cPhone.innerHTML = "";
	cAddr.innerHTML = "";
	
	if(nick == "" || !nickJ.test(nick)){
		cNick.innerHTML ="닉네임을 써주세요 닉네임은 한글 숫자 영어만 가능합니다. 4-12 글자";                                    
	    frm.nick.focus();
        return false;	
	}

	if(pw == ""){
		cPw.innerHTML = "비밀번호를 써주세요";
		   frm.pw.focus();
		   return false;	
	}
	if(!pwJ.test(pw)){
		cPw.innerHTML = "비밀번호는 영어(대소문자), 숫자만 가능합니다. 4이상 12까지";
		   frm.pw.focus();
		   return false;	
	}
	if(pwchk == ""){
		cPw.innerHTML = "비밀번호 확인을 해주세요 ᕦ(ò_óˇ)ᕤ";
		   frm.pw.focus();
		   return false;	
	}
	if(pw != pwchk){
		cPw.innerHTML = "기존 비밀번호와 다름니다 ";
		   frm.pwchk.focus();
		   return false;	
	}

	if(phoneNum == "" || !phoneJ.test(phoneNum)){
		cPhone.innerHTML = "정확한 핸드폰 번호를 입력해 주세요";
		frm.phoneNum.focus();
		return false;	
	}
	if(addressA == ""){
		cAddr.innerHTML = "주소를 입력해주세요";
		frm.addressA.focus();
		return false;	
	}
	 frm.submit();
}

// 비밀번호 찾기
function chkEmailSubmit() {
	var frm = document.findPwFrm;
	
	var email = frm.email.value.trim();
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 document.getElementById("chkid").innerHTML = "";
     
	if(email == ""){
		document.getElementById("chkid").innerHTML = "이메일을 써주세요";                
		document.getElementById('chkid').style.color = "#f44336";
	    frm.email.focus();
        return false;
	}
	
	if(!mailJ.test(email)){
		   document.getElementById("chkid").innerHTML = "잘못된 email 입니다";     
		   document.getElementById('chkid').style.color = "#f44336";                   
		   frm.email.focus();
           return false;
	}
	
	frm.submit();
}  
function joinEmailSubmit() {
	var frm = document.joinEmailFrm;
	
	var email = frm.email.value.trim();
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 document.getElementById("chkEmail").innerHTML = "";
     
	if(email == ""){
		document.getElementById("chkEmail").innerHTML = "이메일을 써주세요";
		document.getElementById('chkEmail').style.color = "#f44336";
	    frm.email.focus();
        return false;
	}
	
	if(!mailJ.test(email)){
		   document.getElementById("chkEmail").innerHTML = "잘못된 email 입니다";      
		   document.getElementById('chkEmail').style.color = "#f44336";
		   frm.email.focus();
           return false;
	}
	
	frm.submit();
}  
//비밀번호 변경
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







