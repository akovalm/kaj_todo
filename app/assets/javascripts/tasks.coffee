# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # Update task status by checkbox
  $(document).on 'change', '.b-task input[type="checkbox"]', (event) ->
    event.preventDefault()
    $this = $(@)

    is_checked = $this.is(':checked')
    id = $this.data('id')

    status = 2 # active
    if is_checked
      status = 3 # completed

    if id != undefined && parseInt(id) > 0
      $.ajax
        url: 'tasks/' + id
        type: 'patch'
        data: { task: { id: id, status: status } }
        dataType: 'json'
        success: (data) ->
          if data != undefined && data['name'] != undefined && data['status'] != undefined
            $this.closest('.b-task').find('.task-title').text("#{data['name']} (#{data['status']})")
        error: (data) ->
          $this.closest('.b-task').find('.task-title').text("Updating task (id=#{id}) status failed")