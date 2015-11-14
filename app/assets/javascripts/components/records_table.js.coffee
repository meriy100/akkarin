$("document").ready ->

  records_table_change = (scope) ->
    target = $(scope).data "table"

    # 現在の button の active を削除
    $(".records-table-change.active").removeClass "active"

    # 現在表示されているテーブルを非表示に
    $(".records-table.active").hide()
    $(".records-table.active").removeClass "active"

    # target のテーブルを表示
    $("#" + target).show()
    $("#" + target).addClass "active"

    # 押されたボタンを active に変更
    $(scope).addClass "active"

  $(".records-table-change").on "click", -> records_table_change(this)


  # テーブル表示の初期化
  $(".records-table").each ->
    $(this).hide()
  $(".records-table.active").show()



