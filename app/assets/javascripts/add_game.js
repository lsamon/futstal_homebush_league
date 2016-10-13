$(document).ready(function(){

  $('.gamedate').datetimepicker({
      format: 'DD/MM/YYYY HH:MM'
    });

  $('.add_game').click(function(){

    var $form = $('.game_fields').html();
    $('.new_game_container').after($form);
    $('.gamedate').datetimepicker({
      format: 'DD/MM/YYYY HH:MM'
    });

  });
})
