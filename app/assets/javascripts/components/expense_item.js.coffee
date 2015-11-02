$("document").ready ->

  expense_items_change = (scope) ->
    target = $(scope).data "table"

    $(".expense-items-change.active").removeClass "active"

    $(".items-table.active").hide()
    $(".items-table.active").removeClass "active"

    $("#" + target).show()
    $("#" + target).addClass "active"

    $(scope).addClass "active"

  $(".expense-items-change").on "click", -> expense_items_change(this)


  $(".items-table").each ->
    $(this).hide()
  $(".items-table.active").show()



