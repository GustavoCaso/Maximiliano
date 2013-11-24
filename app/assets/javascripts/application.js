// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/bootstrap
//= require quicksand
//= require_tree .

$(document).ready(function(){
  var $holder = $('.container_gallery');

  var $data = $holder.clone();

  $('.coleccion li a').on('click', function(e){

    $('.coleccion li').removeClass('active');

    var $filterType = $(this).attr('class');
    $(this).parent().addClass('active');
    if($filterType == "all"){
      var $filteredData = $data.find('img');
    }else{
      var $filteredData = $data.find('img[data-type=' + $filterType + ']');
    }

    $holder.quicksand($filteredData,{
      duration: 800
    });
    return false;
  });
});


