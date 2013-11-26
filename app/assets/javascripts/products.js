// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  var $holder = $('ul.ourHolder');

  var $data = $holder.clone();


  $('ul.quicksand li a').on('click', function(e){

    $('ul.quicksand li').removeClass('active');

    var $filterType = $(this).attr('class');
    $(this).parent().addClass('active');
    if($filterType == "all"){
      var $filteredData = $data.find('li');
    }else{
      var $filteredData = $data.find('li[data-type=' + $filterType + ']');
    }

    $holder.quicksand($filteredData,{
      easing: 'easeInOutQuad',
      duration: 800
    });
    return false;
  });
});
