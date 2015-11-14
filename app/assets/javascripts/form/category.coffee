$ ->
  do ->
    replace_select_options = ($select, results) ->
      $select.html $('<option>')
      $.each results, ->
        console.log this.data
        option = $('<option>').val(this.id).text(this.name).attr("data-children-path", this.data)
        $select.append(option)

    replace_children_options = (scope) ->
      children_path = $(scope).find("option:selected").data "children-path"
      $select_children = $($(scope).data "target")
      console.log children_path
      console.log $select_children
      if children_path?
        $.ajax
          url: children_path
          dataType: "json"
          success: (results) ->
            replace_select_options($select_children, results)
          error: (XMLHttpRequest, textStatus, errorThrown) ->
            console.error("Error occurred in replace_children_options")
            console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
            console.log("textStatus: #{textStatus}")
            console.log("errorThrown: #{errorThrown}")
      else
        replace_select_options($select_children, [])

    $('.select-parent').on 'change', -> replace_children_options(this)

#$("document").ready ->
#  category_change = (scope) ->
#    category_id = $(scope).val()
#    target = $(scope).data("sub-category")
#    console.log target
#    $.ajax(
#      url: "/service/sub_categories"
#      data: {
#        category_id: category_id,
#        target: target
#      }
#      dataType: 'json'
#      success: (data, dataType) ->
#        console.log "ok"
#      error:
#        console.log "error"
#    )
#
#  $("body").on("change", ".selectcategory", ->
#    category_change(this)
#  )
#  
