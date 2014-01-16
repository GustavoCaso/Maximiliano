$(document).ready(function(){
  $('#sizes_sample').click(function(e){
    e.preventDefault();

    var maskHeight = $(document).height();
    var maskWidth = $(document).width();

    $('#mask').css({width: maskWidth, height: maskHeight});

    $('#mask').fadeIn(1000);
    $('#mask').fadeTo('slow', 0.8);

    var winH = $(window).height();
    var winW = $(window).width();

    $('#dialog').css('top', winH/2-$('.window').height()/2);
    $('#dialog').css('left', winW/2-$('.window').width()/2);

    $('#dialog').fadeIn(2000);
  });



  $('#mask').click(function(){
    $(this).hide();
    $('.window').hide();
  });
})