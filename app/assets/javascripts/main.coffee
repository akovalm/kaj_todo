# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  $.fn.datepicker.defaults.format = "yyyy-mm-dd";

  $(document).on 'mouseover', '.b-tasks tr', (event) ->
    event.preventDefault()
    $(@).find('.t-col-chb').toggleClass('hidden');
    $(@).find('.t-col-btns').toggleClass('hidden');

  $(document).on 'mouseout', '.b-tasks tr', (event) ->
    event.preventDefault()
    $(@).find('.t-col-chb').toggleClass('hidden');
    $(@).find('.t-col-btns').toggleClass('hidden');