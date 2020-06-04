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
      $('.datepicker').datepicker({
          disableWeekends: true
      });
      $('.tooltipped').tooltip();
      $('.scrollspy').scrollSpy();

      
    var inputs = $(".progress1-container").find($("label") );
    
    
    for(var i =0 ; i< inputs.length; i ++)
    { 
         var index = i +1;
         var time = (i +1) * 100;
        $(".progress1-container label:nth-child("+ index+")").css( "-webkit-animation", "anim 6s "+time+"ms 1 forwards" );
        $(".progress1-container label:nth-child("+index+")").css( "-animation", "anim 6s "+time+"ms 1 forwards" );
    }


    });