class AddDateToTransfer < ActiveRecord::Migration
  def change
    add_column :transfers, :date, :date
  end
end
