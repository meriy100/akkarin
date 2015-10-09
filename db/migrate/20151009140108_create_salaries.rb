class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.string :name
      t.integer :user_id
      t.integer :price
      t.text :remarkds
      t.integer :wallets_id

      t.timestamps null: false
    end
  end
end
