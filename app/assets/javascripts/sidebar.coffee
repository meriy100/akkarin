$(document).ready ->
  $("#menu-toggle-left").on "click", (e) ->
    e.preventDefault
    $("#wrapper").toggleClass("active-left")


