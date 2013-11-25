// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){

$(window).resize(function(){

    var background = $('#collection');
    var height = $('.container_gallery').height();
    background.css({"height": height});

});


$('#product_category').on('change', function(){
      var category = $('#product_category :selected').val();
      console.log(category);
      if ( category == "coleccion"){
        $('.sub_category').append('<div class="field coleccion_sub_category"><label for="product_sub_category">Sub category</label><select id="product_sub_category" name="product[sub_category]"><option value="CHANNEL">CHANNEL</option><option value="PIEL">PIEL</option><option value="TRAJES">TRAJES</option><option value="ABRIGOS">ABRIGOS</option></select></div>');
      } else if(category == "urbano"){
        $('.sub_category').append('<div class="field urbano_sub_category"><label for="product_sub_category">Sub category</label> <select id="product_sub_category" name="product[sub_category]"><option value="PUNTO CLASICO">PUNTO CLASICO</option><option value="PUNTO DECO">PUNTO DECO</option><option value="BÁSICOS">BÁSICOS</option><option value="IMPERMEABLES">IMPERMEABLES</option></select></div>');
      } else if(category == "accesorios"){
        $('.sub_category').append('<div class="field accesorios_sub_category"><label for="product_sub_category">Sub category</label><select id="product_sub_category" name="product[sub_category]"><option value="MANTAS">MANTAS</option> <option value="COJINES">COJINES</option><option value="COLLARES">COLLARES</option><option value="CORREAS">CORREAS</option></select></div>')
      }
    });
});