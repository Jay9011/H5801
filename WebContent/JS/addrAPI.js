/**
 * 
 */

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