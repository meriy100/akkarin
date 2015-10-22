class CreateDateExpenses < ActiveRecord::Migration
  def change
    create_table :date_expenses do |t|
      t.date :date
      t.integer :expense_item_id

      t.timestamps null: false
    end
  end
end
