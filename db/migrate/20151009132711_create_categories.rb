class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :color_id
      t.integer :user_id
      t.integer :wallet_id

      t.timestamps null: false
    end
  end
end
