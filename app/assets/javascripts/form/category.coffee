#$(document).on 'ready page:load', ->
#  $('.create-category').on "click", ->
#    $cur_td = $(this)
#    word = $cur_td.text()
#    $.ajax
#      async: true ,
#      url : '../user/categories/new'
#      type: "GET",
#      data: {id : $cur_td.id},
#      dataType : 'json',
#      success : (data, dataType) ->
#        $('#myModal').modal('show')

#$('#form-body').append("<%=j render '/user/categories/form' %>")
#$('#form').modal('show')

#$('button.close').on 'click', ()->
#  $('#new_category').remove()

#$('#form').modal('hide')
#$('#new_category').remove()
