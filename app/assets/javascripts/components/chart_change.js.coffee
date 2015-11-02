$("document").ready ->
  chart_change = (scope) ->
    target = $(scope).data("chart")
    $(".active-chart").hide()
    $(".active-chart").removeClass "active-chart"
    $("#" + target).show()
    $("#" + target).addClass "active-chart"
    $(".active-chart-button").removeClass "active-chart-button"
    $(scope).addClass "active-chart-button"

  $(".chart-change").on "click", -> chart_change(this)

