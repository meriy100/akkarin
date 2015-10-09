class CreateShortCcs < ActiveRecord::Migration
  def change
    create_table :short_ccs do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :sub_category_id

      t.timestamps null: false
    end
  end
end
