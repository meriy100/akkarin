class Budget < ActiveRecord::Base
  validates :user_id, :category_id, :price, :started_date, :finished_date, precense: true
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
end
