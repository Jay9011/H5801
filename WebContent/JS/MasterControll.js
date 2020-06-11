$(document).ready(function(){
    if($(window).width() < 590) {
        $("#tbody1").hide();
    }
   if($(window).width() > 591) {
        $("#tbody1").show();
    }
})


document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems);
  });

  $(window).resize(function() { if($(window).width() < 590) {
    $("#tbody1").hide();
  } });
  
  $(window).resize(function() { if($(window).width() > 591) {
    $("#tbody1").show();
  } });