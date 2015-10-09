class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name
      t.integer :user_id
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :price
      t.date :started_date
      t.date :finished_date
      t.text :remarks

      t.timestamps null: false
    end
  end
end
