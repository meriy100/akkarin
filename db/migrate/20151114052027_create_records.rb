class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id, null: false
      t.integer :record_type, null: false
      t.string :name
      t.integer :category_id, null: false
      t.integer :sub_category_id
      t.integer :price, null: false, default: 0
      t.date :date, null: false
      t.text :remarks
      t.integer :from_wallet_id, null: false
      t.integer :to_wallet_id
      t.integer :commission, default: 0
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
