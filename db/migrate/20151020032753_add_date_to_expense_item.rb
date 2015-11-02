class AddDateToExpenseItem < ActiveRecord::Migration
  def change
    add_column :expense_items, :date, :date
  end
end
