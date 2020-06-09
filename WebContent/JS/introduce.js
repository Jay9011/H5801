var map;
var marker;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 37.6267711, lng: 127.0759383 },
        zoom: 17
    });

    marker = new google.maps.Marker({
        map : map,
        draggable: true,
        animation: google.maps.Animation.BOUNCE,
        position: { lat: 37.500905, lng: 127.035858 }
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


document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.carousel');
    var instances = M.Carousel.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.carousel').carousel({
    	dist : -20,
    	duration : 100
    });
  });