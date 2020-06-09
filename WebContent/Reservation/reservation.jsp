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
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<jsp:include page="../header.jsp" />
	<!-- 페이지에 해당하는 내용 적기  -->
	<section class="container section scrollspy" id="intro">
		<div class="row">
			<div class="col m12">
				<!--  여기에다가 적어주기 (반응형은 필수이다. -->
				<h3 class="center-align pfont">독서실 예약하기</h3>
				<div class="row" style="border-radius: 5px; border: 1px solid #ffa537;">
					<!-- <h3 class="center-align pfont">2020.05.27(여기다 날짜 나오게 하고싶다 소근소근)</h3> -->
					<div class="col s12">
						<form id="frm" action="index.ho">
							<input id="selectDate" type="text" class="datepicker pfont" readonly="readonly">
							<input id="item_name" name="item_name" type="text">
							<input id="total_amount" name="total_amount" type="text">
							<input id="m_uid" name="m_uid" type="text">
							<input id="t_uid" name="t_uid" type="text">
						</form>
					</div>
					<!-- 					<div class="row"> -->
					<div id="rooms" class="col s6" style="border-radius: 5px; border: 1px solid #ffa537;">
						<div>
							<div class="col s3">
								<button id="101" class="col btn-large disabled" name="action" onclick="selectRoom($(this).attr('id'))">1번방</button>
							</div>
							<div class="col s3 offset-s6">
								<button id="104" class="col btn-large" name="action" onclick="selectRoom($(this).attr('id'))">4번방</button>
							</div>
						</div>
						<div>
							<div class="col s3">
								<button id="102" class="col btn-large" name="action" onclick="selectRoom($(this).attr('id'))">2번방</button>
							</div>
							<div class="col s3 offset-s6">
								<button id="105" class="col btn-large" name="action" onclick="selectRoom($(this).attr('id'))">5번방</button>
							</div>
						</div>
						<div class="col s3">
							<button id="103" class="col btn-large" name="action" onclick="selectRoom($(this).attr('id'))">3번방</button>
						</div>
					</div>

					<div class="col s6" style="border-radius: 5px; border: 1px solid #ffa537;">
						<div id="RoomInfo" class="col s12 center-align">
							<h5>방을 선택해 주세요</h5>
						</div>
						<div class="col s12 center-align">
							<button type="submit" class="btn-large" name="action" onclick="$('#frm').submit();">예약하기</button>
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
	$(function() {
		var selectedDate = $("#selectDate").val();
		pickedDate(selectedDate);
	});

	function pickedDate(sdate) {
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
					$("#RoomInfo").html("<h5>방을 선택해 주세요</h5>");
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
					$("#RoomInfo").html("<h3>" + info.t_name + " 번방<span style='font-size:0.5em'>을 선택</span></h3><p>최대 " + info.t_maxnum + " 인 가능</p>");
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

	$(document).ready(function() {
		$('.modal').modal();
	});

</script>
</html>
