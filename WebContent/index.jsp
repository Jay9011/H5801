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
            <h2 class="pfont amber-text text-darken-3 textdarken-4 ">Study </h2>
            <p class="pfont">저희 스터디룸은 4인, 6인, 8인이 이용할 수 있으며, 하루동안 사용할 수 있습니다.</p>
        </div>
        <div class="col s6">
            <img src="IMAGES/books-2596809_1920.jpg" alt="" class="responsive-img materialboxed">
        </div>
        <div class="col s6">
            <h2 class="pfont amber-text text-darken-3 textdarken-4" >Portraits</h2>
            
        </div>
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
            <h2 class="amber-text text-darken-3">Hello there~</h2>
            <p>Your courses have been extremely helpful and a real time saver.
                I've been banging my head on this little bit for </p>
                <p>Your courses have been extremely helpful and a real time saver.
                    I've been banging my head on this little bit for </p>
                
        </div>
        <div class="col s6 16 offset-12">
            <ul class="tabs">
                <li class="tab col s6">
                    <a href="#photography" class="amber-text text-darken-3">Photography</a>
                </li>
                <li class="tab col s6">
                    <a href="#editing" class="amber-text text-darken-3">Editing</a>
                </li>
            </ul>
            <div class="col s12" id="photography">
                <p class="flow-text amber-text text-darken-3">PHOTOGRAPHY</p>
                <p>Your courses have been extremely helpful and a real time saver.
                    I've been banging my head on this little bit for </p>
                    <p>Your courses have been extremely helpful and a real time saver.
                        I've been banging my head on this little bit for </p>
            </div>
            <div class="col s12" id="editing">
                <p class="flow-text amber-text text-darken-3">EDITING</p>
                <p>Your courses have been extremely helpful and a real time saver.
                    I've been banging my head on this little bit for </p>
                    <p>Your courses have been extremely helpful and a real time saver.
                        I've been banging my head on this little bit for </p>
            </div>
        </div>
    </div>
  </section>
  <!-- parallax -->
  <div class="parallax-container">
    <div class="parallax">
        <img src="IMAGES/narrative-794978_1920.jpg" alt="" class="responsive-img">
    </div>
</div>
  <!-- contact form -->
 <jsp:include page="foot.jsp"/>
</body>
</html>
