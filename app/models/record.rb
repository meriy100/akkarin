class Record < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  belongs_to :from_wallet, class_name: "Wallet"
  belongs_to :to_wallet, class_name: "Wallet"

  validates :user_id, :record_type, :price, :date, :from_wallet_id, :category_id, presence: true


end
