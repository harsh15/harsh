$(document).ready ->
  $('#user_state_id').change ->
    if $(this).data('options') == undefined
      $(this).data 'options', $('#user_city_id option').clone()
    options = $(this).data('options').filter('[class=' + 'state_' + $(this).val() + ']')
    $('#user_city_id').html options
    return
