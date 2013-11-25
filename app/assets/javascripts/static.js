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


   $('.coleccion_sub_category').hide();
   $('.urbano_sub_category').hide();
   $('.accesorios_sub_category').hide();

   $('#product_category').on('change', function(){
      var category = $('#product_category :selected').val();
      console.log(category);
      if ( category == "coleccion"){
        $('.coleccion_sub_category').show();
        $('.urbano_sub_category').hide();
        $('.accesorios_sub_category').hide();
      } else if(category == "urbano"){
        $('.urbano_sub_category').show();
        $('.coleccion_sub_category').hide();
        $('.accesorios_sub_category').hide();
      } else if(category == "accesorios"){
        $('.accesorios_sub_category').show();
        $('.coleccion_sub_category').hide();
        $('.urbano_sub_category').hide();
      }
    });
  });