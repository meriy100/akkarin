class RenameColumnToTransfer < ActiveRecord::Migration
  def change
   rename_column :transfers, :form_wallet_id, :from_wallet_id
  end
end
