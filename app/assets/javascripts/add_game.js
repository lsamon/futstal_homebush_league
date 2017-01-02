$(document).ready(function(){

  $('.gamedate').datetimepicker({
      format: 'YYYY-MM-DD HH:mm:ss'
  });

  $('.add_game').click(function(){
    var $form = $('.game_fields').html();
    $('.new_game_container').after($form);
    $('.gamedate').datetimepicker({
      format: 'DD/MM/YYYY h:mm:ss a'
    });

  });

  $(parent).trigger('initialize:frame');
})
