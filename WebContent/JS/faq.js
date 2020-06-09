$(document).ready(function(){
	$('.collapsible').collapsible();
	$(".FAQ").css("display", "none");
	$('.FAQ').fadeIn(700);
	
	 if($(window).width() < 895) {
		  $(".firstSet-1").hide();
	}
	 if($(window).width() > 896) {
		  $(".firstSet-1").show();
	}
	 if($(window).width() < 590) {
		  $(".firstSet-2").hide();
	}
	 if($(window).width() > 591) {
		  $(".firstSet-2").show();
	}
	 if($(window).width() < 590) {
		  $(".firstSet-3").removeClass('w-8');
		  $(".firstSet-3").removeClass('left-1');
		  $(".firstSet-3").addClass('center-align');
	  }
	 if($(window).width() > 591) {
		  $(".firstSet-3").addClass('w-8');
		  $(".firstSet-3").addClass('left-1');
		  $(".firstSet-3").removeClass('center-align');
	  }
	
});

  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems);
  });


  $(window).resize(function() { if($(window).width() < 895) {
	  $(".firstSet-1").hide();
} });

  $(window).resize(function() { if($(window).width() > 896) {
	  $(".firstSet-1").show();
} });
  
  $(window).resize(function() { if($(window).width() < 590) {
	  $(".firstSet-2").hide();
} });

  $(window).resize(function() { if($(window).width() > 591) {
	  $(".firstSet-2").show();
} });
  $(window).resize(function() { if($(window).width() < 590) {
	  $(".firstSet-3").removeClass('w-8');
	  $(".firstSet-3").removeClass('left-1');
	  $(".firstSet-3").addClass('center-align');
  } });
  
  $(window).resize(function() { if($(window).width() > 591) {
	  $(".firstSet-3").addClass('w-8');
	  $(".firstSet-3").addClass('left-1');
	  $(".firstSet-3").removeClass('center-align');
  } });

