class AddRecordTypeToCategoris < ActiveRecord::Migration
  def change
    add_column :categories, :record_type, :integer
    rename_column :categories, :wallet_id, :from_wallet_id
    add_column :categories, :to_wallet_id, :integer
  end
end
