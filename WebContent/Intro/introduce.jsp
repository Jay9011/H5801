<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/indexmain.css">
       	<link rel="stylesheet" href="../CSS/introduce.css">
       	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
		<link rel="stylesheet" href="../package/css/swiper.min.css">
       
       	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
		<script src="../package/js/swiper.min.js"></script>
		<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
       	<script src="../JS/introduce.js"></script>
 <title>FAQ</title>
   </head>
   <body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
<section class="container section scrollspy" id="intro">
	<div class="row">
		<div class="col s1 "></div>
		<div class="col s10">
		<!--  여기에다가 적어주기 (반응형은 필수이다. -->
		
		
			<div class="" id="i_intro">
		<div class="w-12 text_title">
			<h1>Introdus Holic Reading Room</h1>
		</div>
		<div class="left w-8 i_half">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro1.jpeg">
					</div>
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro2.jpeg">
					</div>
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro3.jpg">
					</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
		<div class="left w-4 i_half">
			<h2 class="text">Holic</h2>
			<h4 class="text">Hi! It's a reading room for your comfortable
				reading!</h4>
			<h4 class="text">I'll do my best for the user thank.</h4>

		</div>
	</div>
	<script>
		var swiper = new Swiper('.swiper-container', {
			pagination : {
				el : '.swiper-pagination',
				dynamicBullets : true,
			},
		});
	</script>








	<div id="i_room">
		<div class="w-12 text_title">
			<h1>Study Room Introduction</h1>
		</div>
		<div class="left w-6 r_half">

			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro1.jpeg">
					</div>
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro2.jpeg">
					</div>
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro3.jpg">
					</div>
				</div>

				<div class="swiper-pagination"></div>
			</div>
			<div>
				<h2>ST ROOM</h2>
			</div>
			<div>
				<h4>ST ROOM CONTENT</h4>
			</div>
		</div>

		<div class="left w-6 r_half">

			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro1.jpeg">
					</div>
					<div class="swiper-slide r_size">
						<img src="../IMAGES/intro2.jpeg">
					</div>
					<div class="swiper-slide r_size">
						<img src="...IMAGES/intro3.jpg">
					</div>
				</div>

				<div class="swiper-pagination"></div>
			</div>
			<div>
				<h2>ST ROOM2</h2>
			</div>
			<div>
				<h4>ST ROOM2 CONTENT</h4>
			</div>
		</div>
		
		
		
		
		
					<div class="clear"></div>
			<div class="hr">
				<hr>
			</div>
		<div class="left w-6">
			<div class="w-4 left price">
				<div class="effect-wrap">
					<figure class="effect7 test">
						<div class="w-12 boom">
							<h4 class="center">${introRow[0].t_name }</h4>
						</div>
						<figcaption>
							<div class="w-12 boom">
								<h5>${introRow[0].t_maxnum }</h5>
								<h6>${introRow[0].t_pay }Won</h6>
							</div>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="w-4 left price">
				<div class="effect-wrap">
					<figure class="effect7 test">
						<div class="w-12 boom">
							<h4 class="center">${introRow[1].t_name }</h4>
						</div>
						<figcaption>
							<div class="w-12 boom">
								<h5>${introRow[1].t_maxnum }</h5>
								<h6>${introRow[1].t_pay }Won</h6>
							</div>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="w-4 left price">
				<div class="effect-wrap">
					<figure class="effect7 test">
						<div class="w-12 boom">
							<h4 class="center">${introRow[2].t_name }</h4>
						</div>
						<figcaption>
							<div class="w-12 boom">
								<h5>${introRow[2].t_maxnum }</h5>
								<h6>${introRow[2].t_pay }Won</h6>
							</div>
						</figcaption>
					</figure>
				</div>
			</div>

		</div>
		<div class="left w-6">
			<div class="w-3 left price">
				<div class="effect-wrap">
					<figure class="effect7 test">
						<div class="w-12 boom">
							<h4>2${introRow[3].t_name }</h4>
						</div>
						<figcaption>

							<div class="w-12 boom">
								<h5>${introRow[3].t_maxnum }</h5>
								<h6>${introRow[3].t_pay }Won</h6>
							</div>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="w-3 left price">
				<div class="effect-wrap">
					<figure class="effect7 test">
						<div class="w-12 boom">
							<h4>4${introRow[3].t_name }</h4>
						</div>
						<figcaption>

							<div class="w-12 boom">
								<h5>${introRow[3].t_maxnum }</h5>
								<h6>${introRow[3].t_pay*2}Won</h6>
							</div>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="w-3 left price">
				<div class="effect-wrap">
					<figure class="effect7 test">
						<div class="w-12 boom">
							<h4>6${introRow[3].t_name }</h4>
						</div>
						<figcaption>

							<div class="w-12 boom">
								<h5>${introRow[3].t_maxnum }</h5>
								<h6>${introRow[3].t_pay*3 }Won</h6>
							</div>
						</figcaption>
					</figure>
				</div>
			</div>
			<div class="w-3 left price">
				<div class="effect-wrap">
					<figure class="effect7 test">
						<div class="w-12 boom">
							<h4>8${introRow[3].t_name }</h4>
						</div>
						<figcaption>

							<div class="w-12 boom">
								<h5>${introRow[3].t_maxnum }</h5>
								<h6>${introRow[3].t_pay*4 }Won</h6>
							</div>
						</figcaption>
					</figure>
				</div>
			</div>























		</div>


	</div>


	<script>
		var swiper = new Swiper('.swiper-container', {
			pagination : {
				el : '.swiper-pagination',
				dynamicBullets : true,
			},
		});
	</script>








	<div id="i_map">
		<div class="w-12 text_title">
			<h1>Way to come</h1>
		</div>
		<div class="map map2 w-8 left">
			<div id="map" style="height: 700px;"></div>
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpXCUpAbetxI0sTqAX8IgAJ3UG8zGLn2E&callback=initMap" async defer>
				
			</script>
		</div>
		<!-- //map -->
		<div class="w-4 map2 left">
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
		
		
		
		
		</div>
		<div class="col s1"></div>
	</div>
</section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>