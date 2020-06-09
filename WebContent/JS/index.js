/**
 * index 를 위한 js
 */
  $(document).ready(function(){
      $(window).scroll(function(){

if($(window).scrollTop()>= $("#intro").offset().top ){
 $('nav').addClass('orange lighten-5');
 $('.dropdown-content').css('background-color', '#000000a8');
 $('nav ul a, .alogo, nav .sidenav-trigger i').css('color','#333');
 $('nav ul li a').hover(function(){
  $(this).css('background-color','#ffc380b6');
 }, function(){
  $(this).css('background-color','#00000000');
 });
 $('.dropdown-content a').hover(function(){
  $(this).css('background-color','#111111c0');
 }, function(){
  $(this).css('background-color','#00000000');
 });
}else{
  $('nav').removeClass('orange lighten-5');
  $('.dropdown-content').css('background-color','#00000042');
  $('nav ul a, .alogo, nav .sidenav-trigger i').css('color','white');
  $('.dropdown-content a').hover(function(){
  $(this).css('background-color','black');
 }, function(){
  $(this).css('background-color','#00000000');
 });
  $('nav ul li a').hover(function(){
  $(this).css('background-color','#00000023');
 }, function(){
  $(this).css('background-color','#00000000');
 });
}


});
      $('.sidenav').sidenav();
      $('.materialboxed').materialbox();
      $('.parallax').parallax();
      $(".dropdown-trigger").dropdown({
        coverTrigger: false,
        constrainWidth : false
});
$('.collapsible').collapsible();
    //   수정할수 있게 도와주는 서비스탭
      $('.tabs').tabs();

      $('.scrollspy').scrollSpy();
      // 날짜
      var days = 7;
    var date = new Date();
    var res = date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    var date = new Date();
      $('.datepicker').datepicker({
        format:'yyyy-mm-dd',
         minDate: new Date(),
         maxDate: new Date(res),
         defaultDate: date,
         setDefaultDate : date,
         i18n:{months:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       weekdaysFull: ['일', '월', '화', '수', '목', '금', '토'],
       weekdaysShort:['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
       weekdaysAbbrev:['일', '월', '화', '수', '목', '금', '토'],
       selectMonths: true,
       selectYears: 140,
       showMonthsShort: false,
       showWeekdaysFull: false,
       done:'확인',
       cancel:'취소',
       clear:false}
      ,onClose: function() {
    	  var selectedDate = $("#selectDate").val();
    	  pickedDate(selectedDate);
      	}
       });

    var inputs = $(".progress1-container").find($("label") );


    for(var i =0 ; i< inputs.length; i ++)
    {
         var index = i +1;
         var time = (i +1) * 100;
        $(".progress1-container label:nth-child("+ index+")").css( "-webkit-animation", "anim 6s "+time+"ms 1 forwards" );
        $(".progress1-container label:nth-child("+index+")").css( "-animation", "anim 6s "+time+"ms 1 forwards" );
    }


    });