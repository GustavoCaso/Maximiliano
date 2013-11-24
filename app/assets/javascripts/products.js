// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(window).resize(function(){

    var background = $('#collection');
    var height = $('.container_gallery').height();
    background.css({"height": height});

});