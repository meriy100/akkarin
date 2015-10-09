class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :name
      t.integer :user_id
      t.integer :price

      t.timestamps null: false
    end
  end
end
