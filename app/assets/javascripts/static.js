// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
/*CONTROL TABLE HELP HEIGHT WHEN IS IN SMALL SIZES*/
  $(window).resize(function(){
    var table = $('.table_with_background_of_dog');
    var height = $('#content_help').height();
    table.css({"height": height - 150});

  });


  });