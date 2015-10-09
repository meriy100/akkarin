class ExpenseItem < ActiveRecord::Base
  validates :user_id, :category_id, :price, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  belongs_to :wallet
end
