# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $.fn.datepicker.defaults.format = "yyyy-mm-dd";

  $('.sortable-tasks').sortable
    update: (event, ui) ->
      movement = if ui.position.top - ui.originalPosition.top > 0 then 'down' else 'up'
      id = ui.item.data('id')
      prev_pos = ui.item.prev().data('position')
      pos = ui.item.data('position')
      next_pos = ui.item.next().data('position')

      new_pos = pos
      new_pos = if movement == 'down' then parseInt(prev_pos) + 1 else new_pos = parseInt(next_pos) - 1

      $.ajax
        url: "tasks/#{id}"
        type: 'patch'
        data: { task: { id: id, position: new_pos } }
        dataType: 'json'
        success: (data) ->
          console.log("Successfully changing task (id=#{id}) position")
        error: (data) ->
          console.log("Changing task (id=#{id}) position failed")

  $(document).on 'mouseover', '.b-tasks li', (event) ->
    event.preventDefault()
    $(@).find('.col1').removeClass('invisible');
    $(@).find('.col1').addClass('visible');
    $(@).find('.col4').removeClass('invisible');
    $(@).find('.col4').addClass('visible');

  $(document).on 'mouseout', '.b-tasks li', (event) ->
    event.preventDefault()
    $(@).find('.col1').removeClass('visible');
    $(@).find('.col1').addClass('invisible');
    $(@).find('.col4').removeClass('visible');
    $(@).find('.col4').addClass('invisible');