//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
  var $inputs = "input[type=text], input[type=email]";

  $(document).on("blur", $inputs, function() {
    var $input = $(this);
    $input.parent("li").removeClass("focus filled");

    if(!_.isEmpty($input.val())) {
      $input.parent("li").addClass("filled");
    }
  });

  _.each($($inputs), function(el, i){
    var field = $(el);
    if(!_.isEmpty(field.val())) {
      field.parent("li").addClass("filled");
    }
  });

  $(document).on("focus", $inputs, function() {
    var $selector = $(this).parent("li");
    $selector.addClass("focus");
  });

  $(".alert").on("click", ".close", function(event){
    event.preventDefault();
    var message = $(this).parents(".alert");

    message.fadeOut("fast", function(){
      message.remove();
    });
  });

  $(function() {
    $(window).on("resize", function() {
      if($(window).width() < 620) {
        if(typeof(slideout) == 'undefined') {
          initSlide();
        }
      } else {
        if(typeof slideout != 'undefined') {
          destroySlide();
        }
      }
    });

    if($(window).width() < 620) {
      if(typeof slideout != 'undefined') {
        destroySlide();
      }
      initSlide();
    }
  });
});

initSlide = function() {
  slideout = new Slideout({
    'panel': document.getElementById('panel'),
    'menu': document.getElementById('menu'),
    'duration': 100,
    'padding': 256,
  });

  $('.toggle-button').on('click', function() {
    slideout.toggle();
  });
}

destroySlide = function() {
  slideout.destroy();
  var menu = $(slideout.menu);
  var panel = $(slideout.panel);
  var menuClone = menu.clone();
  var panelClone = panel.clone();
  panel.replaceWith(panelClone);
  menu.replaceWith(menuClone);
  menuClone.removeClass("slideout-menu");
  panelClone.removeClass("slideout-panel");
  delete slideout;
}
