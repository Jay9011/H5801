<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
          <link rel="stylesheet" href="../CSS/introduce.css">
 <title>HOLIC 소개</title>
   </head>
   <body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
     <!-- <div class="parallax-container" style="width: 100%">
      <div class="parallax"><img src="../IMAGES/intro1.jpeg"></div>
    </div> -->
<section class="container section scrollspy" id="intro">
   <div class="row">
      <div class="col s1 "></div>
      <div class="col s10">
      <!--  여기에다가 적어주기 (반응형은 필수이다. -->

         <div id="i_intro" class="section scrollspy pfont set-2">
      <div class="w-12 center-align firstSet-1">
         <h1 class="pfont t1">Introduce Holic Reading Room</h1>
      </div>
      <div class="hr firstSet-1">
         <hr style="border: 2px solid black;">
      </div>
      <div class="clear"></div>
      <div>
      <div class="left-align t2" style="font-size: 40px">안녕하세요 Holic 독서실입니다</div>
      <div class="left-align firstSet-2" style="font-size: 30px">
      <br>쾌적한 환경과 간단한 편의시설이 구비되어있습니다
      <br>웹사이트를 통해 이용해주시는 분들의 일정 예약을 하실 수 있으니
      <br>시간에 구애받지 않고 편안한 마음으로 공부하실 수 있습니다.
      <br><br><br>
   <div class="carousel w-12 center-align">
       <a class="carousel-item duration" href="#one!"><img class="materialboxed" width="100%" src="../IMAGES/slide1.jpg"></a>
       <a class="carousel-item duration" href="#two!"><img class="materialboxed" width="100%" src="../IMAGES/slide2.jpg"></a>
       <a class="carousel-item duration" href="#three!"><img class="materialboxed" width="100%" src="../IMAGES/slide3.jpg"></a>
       <a class="carousel-item duration" href="#four!"><img class="materialboxed" width="100%" src="../IMAGES/slide4.jpg"></a>
       <a class="carousel-item duration" href="#five!"><img class="materialboxed" width="100%" src="../IMAGES/solo.jpg"></a>
    </div>
    <div class="center-align firstSet-1" style="font-size: 30px"> 위의 사진을 클릭하시면 큰화면으로 보실 수 있습니다.</div>
      </div><!-- END I_INTRO -->




   </div>
   </div>
   </section>

    <div class="parallax-container firstSet-1" style="width: 100%">
      <div class="parallax"><img src="../IMAGES/roll1.jpg"></div>
    </div>

   <section class="container section scrollspy" id="intro">
   <div class="row">
   <div class="col s1 "></div>
      <div class="col s10">





   <div id="i_room" class="section scrollspy pfont set-2">
      <div class="w-12 center-align t1 firstSet-1">
         <h1>Study Room Introduction</h1>
      </div>
      <div class="hr firstSet-1">
         <hr style="border: 2px solid black;">
      </div>
      <div class="clear"></div>


      <div class="left-align t2" style="font-size: 40px">좋은 독서실이 좋은 성적으로!</div>
      <div class="left-align firstSet-2" style="font-size: 30px">
      <br>집중해서 혼자 공부할수있는 개인실과
      <br>팀프로젝트, 토론, 스터디모임등 단체로 모일수있는 다인실이 준비되어있습니다.
      <br>공부하다 모르는건 언제든지 Holic 속의 학습문의 게시판에 남겨주세요 많은사람들이 도와줄거에요!
      <br><br><br>
      </div>



   <div class="card w-4 left">
       <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="../IMAGES/room1.jpg">
   </div>
    <div class="card-content">
       <span class="card-title activator grey-text text-darken-4 center-align">Room<p>(다인실)</p></span>
    </div>
    <div class="card-reveal">
       <span class="card-title grey-text text-darken-4">Room(다인실)<i class="material-icons right card-title" style="position: absolute;top: 15px;right: 10px;">close</i></span>
       <p>다인실입니다 1일 단위로 빌릴수있으며 인원수에따른 가격이다릅니다
       <br>
       <br>${ introRow[0].t_name} ${ introRow[0].t_pay} Won
       <br>${ introRow[1].t_name} ${ introRow[1].t_pay} Won
       <br>${ introRow[2].t_name} ${ introRow[2].t_pay} Won
       </p>
     </div>
     </div>

   <div class="card w-4 left">
       <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="../IMAGES/QA.jpg">
   </div>
    <div class="card-content">
       <span class="card-title activator grey-text text-darken-4 center-align">Learning Inquiry(문의)</span>
    </div>
    <div class="card-reveal">
       <span class="card-title grey-text text-darken-4">Learning Inquiry(문의)<i class="material-icons right card-title" style="position: absolute;top: 15px;right: 10px;">close</i></span>
       <p>여러분들의 고민이나 질문들을 다같이 공유할수있습니다
       <br>마음 맞는 사람들끼리 스터디룸을 잡아보는건 어떨까요?
       </p>
       <p><a href="${pageContext.request.contextPath}/StudyBoard/list.ho">물어볼게 생겼나요? Click!</a></p>
     </div>
     </div>

   <div class="card w-4 left">
       <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="../IMAGES/solo.jpg">
   </div>
    <div class="card-content t3">
       <span class="card-title activator grey-text text-darken-4 center-align">Private room(개인실)</span>
    </div>
    <div class="card-reveal">
       <span class="card-title grey-text text-darken-4 ">Private room(개인실)<i class="material-icons right card-title" style="position: absolute;top: 15px;right: 10px;">close</i></span>
       <p style="color: red"> 예정중입니다</p><p> 2시간 단위로 빌릴수있으며 시간에따른 가격이다릅니다 증축 하고있습니다
       <br>
       <br>&nbsp;&nbsp;2H Reservation ${ introRow[3].t_pay} Won
       <br>&nbsp;&nbsp;4H Reservation ${ introRow[3].t_pay*2} Won
       <br>&nbsp;&nbsp;8H Reservation ${ introRow[3].t_pay*3} Won
       <br>10H Reservation ${ introRow[3].t_pay*4} Won
       </p>
     </div>
     </div>


      </div><!-- END I_ROOM -->

   </div>
   </div>
   </section>

    <div class="parallax-container firstSet-1" style="width: 100%">
      <div class="parallax"><img src="../IMAGES/roll2.jpg"></div>
    </div>






   <section class="container section scrollspy" id="intro">
   <div class="row">
   <div class="col s1 "></div>


   <div id="i_map" class="section scrollspy pfont set-2">
      <div class="w-12 text_title t1">
         <h1>Way to come</h1>
      </div>
      <div class="map2 left" id="map">
         <div id="map" style="height: 700px;"></div>
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=7498c3868ab21028b64464d2774c74e3"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.4999529, 127.03549318),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);

		var imageSrc = '../IMAGES/mark.png', // 마커이미지의 주소입니다
	    imageSize = new kakao.maps.Size(40, 50), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(37.4999529, 127.03549318); // 마커가 표시될 위치입니다
	    var marker = new kakao.maps.Marker({
	    	  position: markerPosition,
	    	  image: markerImage // 마커이미지 설정
	    	});
	    marker.setMap(map);
	</script>
      </div>
      <!-- //map -->
      <div class="map2 left">
         <div style="text-align: left; padding-left: 40px;">
            <h4>오시는길</h4>
         </div>
         <div style="text-align: left; padding-left: 40px;">
            <h5>적당한 거리에서 버스타고 역삼역 앞에서 50m</h5>
            <h5>우리집에서 택시 : 1시간30분</h5>
            <h5>학원에서 택시 : 6시간 59분</h5>

         </div>
      </div>
      <div class="hr">
         <hr>

      </div>
         </div>
      <div class="col s1"></div>
   </div>
</section>
   <!--  <div class="parallax-container">
      <div class="parallax"><img src="../IMAGES/intro1.jpeg"></div>
    </div> -->

   <jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
<script src="../JS/introduce.js"></script>
</body>
</html>