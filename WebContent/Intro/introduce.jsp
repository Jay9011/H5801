<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<head>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="../package/css/swiper.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="../JS/introduce.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.js"></script>
<script src="../package/js/swiper.min.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
            <jsp:include page="../top.jsp" />
<link rel="stylesheet" href="../CSS/introduce.css">

<meta charset="UTF-8">
<title>Holic</title>



</head>

<body>
		<jsp:include page="../nav.jsp" />
		<jsp:include page="../header.jsp" />

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
								<h6>${introRow[3].t_pay*2 }Won</h6>
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
								<h6>${introRow[3].t_pay}Won</h6>
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
							<h4>8${introRow[3].t_name }</h4>
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
			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpXCUpAbetxI0sTqAX8IgAJ3UG8zGLn2E&callback=initMap"
				async defer>
				
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


	<!-- ******************************************************************************************************************* -->



	<ul>
		<li><input id="rad1" type="radio" name="rad" checked="checked" />
			<label for="rad1">
				<div>Just keep going with longer text</div>
		</label>
			<div class="accslide">
				<div class="content">
					<h1>Just keep going with longer text</h1>
					<p>Lorem ipsum...</p>
				</div>
			</div></li>
		<li>
			<input id="rad2" type="radio" name="rad" />
			 <label for="rad2">
			<div>dasd</div>
			</label>
			<div class="accslide">
				<div class="content">
					<h1>Second panel</h1>
					<p>Lorem ipsum...</p>
				</div>
			</div>
		</li>
		<li><input id="rad3" type="radio" name="rad" /> <label for="rad3">
				<div>Third panel</div>
		</label>
			<div class="accslide">
				<div class="content">
					<h1>Third panel</h1>
					<p>Lorem ipsum...</p>
				</div>
			</div></li>
		<li><input id="rad4" type="radio" name="rad" /> <label for="rad4">
				<div>Fourth panel</div>
		</label>
			<div class="accslide">
				<div class="content">
					<h1>Fourth panel</h1>
					<p>Lorem ipsum...</p>
				</div>
			</div></li>
	</ul>


	<!-- ******************************************************************************************************************* -->







<jsp:include page="../foot.jsp" />
</body>
</html>

