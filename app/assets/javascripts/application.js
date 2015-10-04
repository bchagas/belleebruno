//= require jquery
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
});
