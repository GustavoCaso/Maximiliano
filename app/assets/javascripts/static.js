$(document).ready(function(){
  $(window).resize(function(){
    var table = $('.table_with_background_of_dog');
    var height = $('#content_help').height();
    table.css({"height": height - 150});

  });

/*    $('.small-menu-list').hide();

  $('.small-menu-button').on('click', function(){
    $('.small-menu-list').slideToggle();
  });
*/
});