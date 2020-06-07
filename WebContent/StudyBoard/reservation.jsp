 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../top.jsp"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/indexmain.css">
 <title>타이틀 써주기</title>
   </head>
   <body>
<jsp:include page="../nav.jsp"/>
<jsp:include page="../header.jsp"/>
 <!-- 페이지에 해당하는 내용 적기  -->
<section class="container section scrollspy" id="intro">
	  <div class="row">
          <div class="col m12">
              <!--  여기에다가 적어주기 (반응형은 필수이다. -->
              <h3 class="center-align pfont">독서실 예약하기</h3>
              <div class="row" style="border-radius: 5px; border: 1px solid #ffa537;">
                <h3 class="center-align pfont">2020.05.27(여기다 날짜 나오게 하고싶다 소근소근)</h3>
                  <div class="col s12">
                   <input type="text" class="datepicker" >
                     
                  </div>
              </div>
              <div class="row">
                  <div class="col s12 14 right-align">
                      <button type="button" class="btn waves-effect" onclick="location.href='write.ho'">글쓰기</button>
                  </div>
              </div>
          </div>
      </div>
  </section>

	<jsp:include page="../foot.jsp"/>
<!--  js 추가는 여기에 -->
</body>
</html>
