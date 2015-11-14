class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id
      t.integer :record_type
      t.string :name
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :price
      t.date :date
      t.text :remarks
      t.integer :from_wallet_id
      t.integer :to_wallet_id
      t.integer :commission
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
