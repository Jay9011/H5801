  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.collapsible').collapsible();
    $('.FAQ2').hide();
    $('#FAQBTN').click(function(){
      $('.FAQ2').hide();
      $('.FAQ').fadeIn(500);
    })
    $('#GONGBTN').click(function(){
      $('.FAQ').hide();
      $('.FAQ2').fadeIn(500);
    })

  });