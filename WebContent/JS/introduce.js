var map;
var marker;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 37.5012283, lng: 127.0334121 },
        zoom: 17
    });

    marker = new google.maps.Marker({
        map : map,
        draggable: true,
        animation: google.maps.Animation.BOUNCE,
        position: { lat: 37.5012283, lng: 127.0334121 }
    });
    marker.addListener("click", toggleBounce);
}

function toggleBounce(){
    if(marker.getAnimation() !== null){
        marker.setAnimation(null);
    }else{
        marker.setAnimation(google.maps.Animation.BOUNCE);
    }
}

//=======================
  $(document).ready(function(){

	  if($(window).width() < 590) {
		  $(".firstSet-1").hide();
		  $(".firstSet-2").addClass('set-1');
	  }

	  if($(window).width() > 591) {
		  $(".firstSet-1").show();
		  $(".firstSet-2").removeClass('set-1');
	  }

    $('.carousel').carousel({
       dist : -100,
       duration : 100
    });

  });

  $(window).resize(function() {if($(window).width() < 590) {
	  $(".firstSet-1").hide();
	  $(".firstSet-2").addClass('set-1');
} });

  $(window).resize(function() {	  if($(window).width() > 591) {
	  $(".firstSet-1").show();
	  $(".firstSet-2").removeClass('set-1');
} });
