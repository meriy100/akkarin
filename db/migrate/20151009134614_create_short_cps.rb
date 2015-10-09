class CreateShortCps < ActiveRecord::Migration
  def change
    create_table :short_cps do |t|
      t.integer :short_cc_id
      t.integer :user_id
      t.integer :price

      t.timestamps null: false
    end
  end
end
