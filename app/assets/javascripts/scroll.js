$(document).on('turbolinks:load', function() {
  $('#links a,.footer-links a').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      var x = 0;
      if (target.selector == '#servicesSection'){
        x =190;
      }
      else {
        x = 60;
      }
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top - x
        }, 500);
        return false;
      }
    }
  });
});