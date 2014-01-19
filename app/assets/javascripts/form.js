$(document).ready(function(){
  $('form').on('input', '.price_field input', function(){update_price(this)});
  $('form').on('input', '.discount_field input', function(){update_price(this)});

  function update_price(obj){

    var price = $(obj).closest('.size_price').find('.price_field input').val();
    var discount = $(obj).closest('.size_price').find('.discount_field input').val();
    var index = $(obj).attr('id').match(/\d/);
    $.ajax({url: window.location.origin + "/admin/products/update_price?price=" + price + "&discount=" + discount + "&index=" + index, type: 'post'});

  }

  //Selected display Photo
  var input = $(':radio');
  input.on('click', function(){
     id = $(this).val();
     $.ajax({url: window.location.origin + "/admin/products/default_photo?photo_id=" + id , type: 'post'});
   });


});