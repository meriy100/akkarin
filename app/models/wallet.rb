class Wallet < ActiveRecord::Base
  validates :name, :user_id, :price, presence: true
  belongs_to :user
  has_many :categories
  has_many :sub_categories
  has_many :records, foreign_key: :from_wallet_id
  has_many :to_records, class_name: "Record", foreign_key: :to_wallet_id
  has_many :expense_items
  has_many :salaries

end
