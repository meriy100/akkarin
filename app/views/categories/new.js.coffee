$('#form-body').append("<%=j render 'form' %>")
$('#form').modal('show')

$('button.close').on 'click', ()->
  $('#new_force').remove()
