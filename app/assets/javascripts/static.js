$(document).ready(function(){
/*CONTROL TABLE HELP HEIGHT WHEN IS IN SMALL SIZES*/
  $(window).resize(function(){
    var table = $('.table_with_background_of_dog');
    var height = $('#content_help').height();
    table.css({"height": height - 150});

  });

});