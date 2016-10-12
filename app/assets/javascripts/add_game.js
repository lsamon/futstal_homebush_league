$(document).ready(function(){
  $('.add_game').click(function(){
    var $form = $('#new_game_form').html();
    $('.new_game_container').append($form);
  });
})
