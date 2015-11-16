class Category < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, :color_id, :user_id, :record_type, presence: true
  belongs_to :user
  belongs_to :from_wallet, class_name: "Wallet"
  belongs_to :to_wallet, class_name: "Wallet"
  belongs_to_active_hash :color
  has_many :sub_categories, dependent: :destroy
  has_many :expense_items
  has_many :records
  has_many :short_ccs, dependent: :destroy
  has_many :budgets
  accepts_nested_attributes_for :sub_categories, :allow_destroy => true
  accepts_nested_attributes_for :short_ccs, :allow_destroy => true

  validates :from_wallet_id, presence: true, if: Proc.new{|r| r.record_type != Record::INCOME}
  validates :to_wallet_id, presence: true, if: Proc.new{|r| r.record_type != Record::PAYMENT}
end
