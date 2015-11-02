$('#form-body').append("<%=j render 'form', modal: true %>")
$('#form').modal('show')

$('button.close').on 'click', ()->
  $('#new_force').remove()
