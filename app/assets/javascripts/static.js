$(document).ready(function(){
/*CONTROL TABLE HELP HEIGHT WHEN IS IN SMALL SIZES*/
  $(window).resize(function(){
    var table = $('.table_with_background_of_dog');
    var height = $('#content_help').height();
    table.css({"height": height - 150});

  });




  /*FETCH THE CORRECT DATA FROM THE SUBCATEGORY MENU*/

   // var subcategory = $('#product_sub_category').html();

   //   $('#product_category').on('change', function(){
   //    var category = $('#product_category :selected').val();
   //    var options = $(subcategory).filter("optgroup[label='" + category + "']").html();
   //    if (options){
   //      $(subcategory).html(options);

   //    }else{
   //      $(subcategory).empty();
   //    }

  });