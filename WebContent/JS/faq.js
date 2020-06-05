  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, options);
  });



  $(document).ready(function(){
    $('.collapsible').collapsible();
    $(".FAQ").css("display", "none");
    $('.FAQ').fadeIn(700);
  });
