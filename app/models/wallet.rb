class Wallet < ActiveRecord::Base
  validates :name, :user_id, :price, presence: true
  belongs_to :user
  has_many :categories
  has_many :sub_categories
  has_many :expense_items
  has_many :wallets
end
