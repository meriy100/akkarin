$(document).ready ->
    $('.material-button-toggle').click ->
        $(this).toggleClass('open')
        $('.option').toggleClass('scale-on')
