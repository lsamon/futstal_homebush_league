$(document).ready(function(){

  $('#article_content').wysihtml5();

  $('.gamedate').datetimepicker({
      format: 'yyyy-mm-dd hh:ii'
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
