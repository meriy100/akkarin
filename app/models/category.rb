class Category < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :color_id, :user_id, :wallet_id, presence: true
  belongs_to :user
  belongs_to :wallet
  belongs_to_active_hash :color
  has_many :sub_categories
  has_many :expense_items
  has_many :short_ccs
  has_many :budgets
end
