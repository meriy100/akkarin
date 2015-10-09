class Category < ActiveRecord::Base
  validates :name, :color_id, :user_id, :wallet_id, presence: true
  belongs_to :user
  belongs_to :wallet
  belongs_to :color
  has_many :sub_categories
  has_many :expense_items
  has_many :short_ccs
  has_many :budgets
end
