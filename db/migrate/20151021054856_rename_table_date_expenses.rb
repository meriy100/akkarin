class RenameTableDateExpenses < ActiveRecord::Migration
  def change
    drop_table :date_expenses
  end
end
