class Record < ActiveRecord::Base

  PAYMENT = 1  # 支出
  INCOME = 2   # 収入
  TRANSFER = 3 # 送金

  acts_as_paranoid
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  belongs_to :from_wallet, class_name: "Wallet"
  belongs_to :to_wallet, class_name: "Wallet"

  validates :user_id, :record_type, :price, :date, :from_wallet_id, :category_id, presence: true

  def type_name
    case self.record_type
    when PAYMENT
      I18n.t "activerecord.attributes.record.payment"
    when INCOME
      I18n.t "activerecord.attributes.record.income"
    when TRANSFER
      I18n.t "activerecord.attributes.record.transfer"
    end
  end

  def self.record_type_labels
    [
      [I18n.t("activerecord.attributes.record.payment"), PAYMENT],
      [I18n.t("activerecord.attributes.record.income"), INCOME],
      [I18n.t("activerecord.attributes.record.transfer"), TRANSFER]

    ]
  end


end