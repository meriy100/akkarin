class AddRecordTypeToCategoris < ActiveRecord::Migration
  def change
    add_column :categories, :record_type, :integer
  end
end
