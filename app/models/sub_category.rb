class SubCategory < ActiveRecord::Base
  validates :name, :category_id, :user_id, presence: true
  belongs_to :user
  belongs_to :color
  belongs_to :category
  belongs_to :wallet
  has_many :expense_items
end
