<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:choose>
	<c:when test="${email == null}">
		<script>
			alert("회원이 아니시면 접근할 수 없습니다.");
			location.href = "${pageContext.request.contextPath}/index.ho";
		</script>
	</c:when>
</c:choose>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/reserve.css">
<title>에약하기</title>
<script>
	window.history.forward();
	function blockBack(){window.history.forward();}
</script>
</head>

<body onload="blockBack()" onpageshow="if(event.persisted) blockBack();" onunload="">
	<jsp:include page="../nav.jsp" />
	<jsp:include page="../header.jsp" />
	<!-- 페이지에 해당하는 내용 적기  -->
	  <section class="container section scrollspy" id="intro">
		<div class="row">
			<div class="col m12">
				<!--  여기에다가 적어주기 (반응형은 필수이다. -->
				<h3 class="center-align pfont">독서실 예약하기</h3>
				<div class="row" style="border-radius: 5px; border: 1px solid #ffa537;">
					<div class="col s12">
						<form id="frm" action="${pageContext.request.contextPath}/Payment/pay.ho">
							<input id="selectDate" name="selectDate" type="text" class="datepicker pfont " readonly="readonly">
							<input id="item_name" name="item_name" type="hidden">
							<input id="total_amount" name="total_amount" type="hidden">
							<input id="m_uid" name="m_uid" type="hidden" value="${uid }">
							<input id="t_uid" name="t_uid" type="hidden">
						</form>
					</div>
					<!--<div class="row"> -->
            <div id="rooms" class="col m6 s12" style="margin-bottom: 10px;">
              <div class="col s12 center-align"style="border-radius: 5px;  border: 1px solid #ffa537;
             ">
            <div style="width: 100%;">
                <button id="101" class="col btn-large amber darken-3" name="action" onclick="selectRoom($(this).attr('id'))" style="
                  max-width: 150px;
                  width: 35%;
                  height: 15%;
    margin: 8% 5% 3% 10%;
            ">1번방</button>
                <button id="102" class="col btn-large amber darken-3" name="action" onclick="selectRoom($(this).attr('id'))" style="
          max-width: 150px;
          width: 35%;
          height: 15%;
    margin: 8% 5% 3% 5%;">2번방</button>

          </div>

          <div style="width: 100%; float: left;">

            <button id="103" class="col btn-large amber darken-3" name="action" onclick="selectRoom($(this).attr('id'))" style="
              max-width: 150px;
              width: 35%;
              height: 15%;
    margin: 3% 5% 3% 10%;
     ">3번방</button>

            <button id="104" class="col btn-large amber darken-3 " name="action" onclick="selectRoom($(this).attr('id'))" style="
            max-width: 150px;
            width: 35%;
            height: 15%;
    margin: 3% 5% 3% 5%;
     ">4번방</button>
          </div>

          <div style="width: 100%; float: left;">
          <button id="105" class="col btn-large amber darken-3" name="action" onclick="selectRoom($(this).attr('id'))" style="
           max-width: 150px;
           width: 35%;
           height: 15%;
    margin: 3% 5% 3% 10%;
   ">5번방</button>
            </div>

            </div>
        </div>


          <div class="col m6 s12" style="margin-bottom: 10px;">
            <div class="col s12 center-align"style="border-radius: 5px; border: 1px solid #ffa537;
            ">
						<div id="RoomInfo" class="col s12 center-align">
							<h5 class="pfont">방을 선택해 주세요</h5>
						</div>
						<div class="col s12 center-align" style="margin-bottom: 10px;">
							<button id="submitBtn" type="submit" class="btn-large amber grey-text text-darken-4 disabled" name="action" onclick="$('#frm').submit();">예약하기</button>
						</div>
          </div>
          </div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../foot.jsp" />
	<!--  js 추가는 여기에 -->
</body>
<script>

	function initInput(){
		$("#RoomInfo").html("<h5 class='pfont'>방을 선택해 주세요</h5>");
		$("#item_name").val("");
		$("#total_amount").val("");
		$("#t_uid").val("");
	}

	function pickedDate(sdate) {
		initInput();
		$.ajax({
			type : "POST",
			url : "reservInfo.ho",
			data : {
				'pickedDate' : sdate
			},
			dataType : "json",
			success : function(data) {
				$("#rooms *").removeClass("disabled");
				if (data.status == "OK" && data.count != 0) {
					var row = data.data;
					for (var i = 0; i < row.length; i++) {
						$("#" + row[i].t_uid).addClass("disabled");
					} // end for
				} else if (data.status == "FAIL") {
				} // end if
			},
			error : function(e) {
				console.log("ERROR : ", e);
				alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}

	function selectRoom(roomId){
		initInput();
		$.ajax({
			type : "POST",
			url : "roomInfo.ho",
			data : {
				'roomId' : roomId
			},
			dataType : "json",
			success : function(data) {
				if (data.status == "OK") {
					var info = data.data[0];
					initInput();
					$("#RoomInfo").html("<h3 class='pfont orange-text text-darken-2'>" + info.t_name + " 번방<span class='grey-text text-darken-4' style='font-size:0.5em'>을 선택</span></h3><p class='pfont orange-text text-darken-4' style='font-size:24px;'>" + info.t_pay + "원</p><p class='pfont orange-text text-darken-4'>최대 " + info.t_maxnum + " 인 가능</p>");
					$("#item_name").val(info.t_name + "번 방");
					$("#total_amount").val(info.t_pay);
					$("#t_uid").val(info.t_uid);
					$("#submitBtn").removeClass("disabled");
				} else if (data.status == "FAIL") {
					alert(data.message);
				}
			},
			error : function(e) {
				console.log("ERROR : ", e);
				alert("서버와의 연결이 원활하지 않습니다. 다시 시도해 주세요.");
			}
		});
	}

	/* function payGo(){
		var frm = $("#frm");
		var tuid = $("#t_uid").val();
		if(tuid == null || tuid.trim().equals("")){
			alert("방 선택");
		}
	} */

	$(document).ready(function() {
		$('.modal').modal();
		var selectedDate = $("#selectDate").val();
		pickedDate(selectedDate);
	});

</script>
</html>
