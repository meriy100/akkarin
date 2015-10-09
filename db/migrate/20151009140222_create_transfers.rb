class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :user_id
      t.integer :price
      t.integer :form_wallet_id
      t.integer :to_wallet_id
      t.integer :commission

      t.timestamps null: false
    end
  end
end
