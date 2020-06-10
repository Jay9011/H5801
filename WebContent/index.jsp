<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="top.jsp"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/indexmain.css">
 <title>HolicStudy</title>
 </head>
   <body>
<jsp:include page="nav.jsp"/>
  <header>
<!-- 이부분은 뺴고 가져올것 -->
  <div class="progress1">
    <div class="progress1-container">
      <label> H</label>
      <label> o</label>
      <label> l</label>
      <label> i</label>
      <label> c</label>
    </div>
    </div>
    <!-- 이부분은 뺴고 가져올것 -->
  </header>
<!-- photo / grid -->
  <!-- 3개의 행으로 한 행마다 왼쪽에 이미지 약간의 내용 -->
  <!-- 반응형을 주고  materialboxed로 그림확대기능 -->
  <section class="container section scrollspy" id="intro">
    <div class="row">
        <div class="col s12 14">
            <img src="IMAGES/book-1210027_1920.jpg" alt="" class="responsive-img materialboxed">
        </div>
        <div class="col s12 16">
            <h2 class="pfont amber-text text-darken-3 textdarken-4 ">Study Room</h2>
            <p class="pfont">저희 스터디룸은 4인, 6인, 8인이 이용할 수 있으며, 하루동안 사용할 수 있습니다.</p>
        </div>
        <div class="col s6">
            <img src="IMAGES/book-2020460_1920.jpg" alt="" class="responsive-img materialboxed">
        </div>
        <div class="col s6">
            <h2 class="pfont amber-text text-darken-3 textdarken-4 ">Study</h2>
            <p class="pfont">공부할 수 있는 최적의 환경, 코로나를 방지하기 위해 매일매일 소독을 진행했습니다.</p>
        </div>
        <div class="col s6">
            <img src="IMAGES/books-2596809_1920.jpg" alt="" class="responsive-img materialboxed">
        </div>
        <!-- <div class="col s6">
            <h2 class="pfont amber-text text-darken-3 textdarken-4" >Portraits</h2>
            
        </div> -->
		</div>
	</section>
	<!-- parallax -->
	<div class="parallax-container">
		<div class="parallax">
			<img src="IMAGES/key-5105878_1920.jpg" alt="" class="responsive-img">
		</div>
	</div>
	<!-- services / tabs -->
	<section class="container section scrollspy" id="reserve">
		<div class="row">
			<div class="col s6 14">
				<h2 class="amber-text text-darken-3">Holic 독서실</h2>
				<p class="pfont">Holic 독서실은 '갤러리형의 차별화된 독서실'로, 공부하는 행위와 수험생에 대한
					해석을 공간적으로 풀었습니다. 사람들마다 공부하는 방법과 성향, 시험기간이나 목표, 공부가 잘되는 시간대 등도 다르다고
					생각하여 좌석들을 그룹지어 각기 다른 개성을 가진 공부공간을 만들었습니다.</p>
			</div>
			<div class="col s6 16 offset-12">
				<ul class="tabs">
					<li class="tab col s6"><a href="#photography"
						class="amber-text text-darken-3">StudyCenter</a></li>
					<li class="tab col s6"><a href="#editing"
						class="amber-text text-darken-3">StudyRoom</a></li>
				</ul>
				<div class="col s12" id="photography">
					<p class="flow-text amber-text text-darken-3">StudyCenter</p>

					<p class="pfont">공부하다가 지치면 눕고 싶다, 엎드려서 책읽고 싶다, 벽에 등 기대고 쉬고싶다,
						여럿이 모여 의견을 공유하고 싶다 등등 다양한 욕구를 해소할 수 있는 공간입니다. 커튼과 가구 등 유동적인 도구들을
						이용하여 필요에 따라 시선과 움직임을 조정할 수 있도록 한 것도 일반독서실과는 차별되는 특징이라 할 수 있습니다.</p>
				</div>
				<div class="col s12" id="editing">
					<p class="flow-text amber-text text-darken-3">StudyRoom</p>
					<p class="pfont">공부공간은 모두 반오픈형으로 일반책상보다 폭이 넓고 개인용 공간이 충분하도록 하였고
						좌석별로 스탠딩 테이블을 추가하거나 개인용 책꽂이, 룸형식으로 조성하여 공부 방법에 변화를 줄 수 있는 특별한 공간으로
						총 45석을 마련하였습니다.</p>

				</div>
			</div>
		</div>
	</section>
	<!-- parallax -->
	<div class="parallax-container">
		<div class="parallax">
			<img src="IMAGES/narrative-794978_1920.jpg" alt=""
				class="responsive-img">
		</div>
	</div>
	<!-- contact form -->
	<jsp:include page="foot.jsp" />
</body>
</html>
