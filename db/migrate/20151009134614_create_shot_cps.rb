class CreateShotCps < ActiveRecord::Migration
  def change
    create_table :shot_cps do |t|
      t.integer :short_cc_id
      t.integer :user_id
      t.integer :price

      t.timestamps null: false
    end
  end
end
