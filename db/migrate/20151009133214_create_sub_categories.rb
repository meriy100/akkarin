class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.integer :wallet_id

      t.timestamps null: false
    end
  end
end
