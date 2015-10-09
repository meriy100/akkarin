class CreateExpenseItems < ActiveRecord::Migration
  def change
    create_table :expense_items do |t|
      t.string :name
      t.integer :user_id
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :price
      t.text :remarks
      t.integer :wallet_id

      t.timestamps null: false
    end
  end
end
