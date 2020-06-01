<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Berkshire+Swash&family=Henny+Penny&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
   
/* @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@400;700&display=swap'); */

*{
    margin: 0;
    padding: 0;
    color : #000;
    font-family: 'Do Hyeon', sans-serif; /* 네브 전용(네브 바) */
    font-family: 'Nanum Gothic', sans-serif; /* 글 전용 */
    box-sizing: border-box;
}
html,body{ width:100%; height:100%; background-color: olive;}
ul, li, ol{
   list-style: none;
}
a{
    text-decoration: none;
    outline: none;
}
.container{ 
    position: fixed;
    width: 100%;
    padding: 0 13%;
  
}
.container:hover{
    background-color: rgba(255, 255, 255, 0.5);
}
header{
    width: 100%;
    height: 80px;   
    display: flex; 
   align-items: center;
   justify-content: space-between;
}


header > h1 a{
    font-family:'Berkshire Swash', cursive;
   margin-left: 20px;
   font-size: 1.5em;
}
header > nav.Hnav{
  width: 650px; /*  로그인버튼일때는 650px */
  height: 100%;
}
header ul {
	width:100%;
	height: 100%;
	display: flex;
	justify-content: space-between;
}
header ul > li {
	font-size:20px;
	height: 100%;
	display: flex;
	align-items: center;
}
header ul > li a{
    padding: 10px 25px;
}
li button{
    padding: 5px 15px;
    font-size: 15px;
    background-color: white;
    color: olive;
    border-radius: 5px;
    border: 1px solid olive;

}
.box{ width:100%; height:100%; color:#ffffff; font-size:24pt;}

</style>
</head>
<body>
<c:choose>
<c:when test="${email != null }">
<script>
	$(document).ready(function() {
		$("nav.Hnav").css('width','800px');
		$("nav.Hnav li button.btnIn").css('display', 'none');
		$("nav.Hnav .btnOut").css('display', 'block');
		$('.loginNN').click(function() {
			$(this).attr('href', 'reservation.jsp');
		});
	});
</script>
</c:when>
<c:otherwise>
<script>
$(document).ready(function() {
	$('.loginNN').click(function() {
		var a = confirm("로그인은 필수입니다.\n 로그인하시겠습니까?");
		if(a){
			location.replace("login.ho");
		}
	});
});
</script>
</c:otherwise>
</c:choose>
    <div class="container">
<header>
    <h1><a href="testmain.html">Holic</a></h1>
    <nav class="Hnav">
        <ul>
            <li><a href="">Holic 소개</a></li>
            <li><a class="loginNN">독서실 예약</a></li>
            <li><a  href="">학습 문의</a></li>
            <li><a href="">게시판</a></li>
            <li><a class="btnOut" style="display: none;" href="#">마이페이지</a></li>
            <li>
           		 <button class="btnIn"  onclick="location.href='login.ho'">로그인</button>
                <button  class="btnOut" style="display: none;" onclick="location.href='logout.ho'">로그아웃</button>
            </li>
        </ul>
    </nav>
</header>
</div>
<article>
    
</article>

    <div class="foot">
<footer>

</footer>
</div>

</body>
</html>