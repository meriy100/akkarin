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

  before_validation :set_from_wallet, if: "from_wallet.blank?"
  before_validation :set_record_type, if: "record_type.blank?"

  before_save :update_wallet

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
      [I18n.t("activerecord.attributes.record.payment"), PAYMENT,
        data: {children_path: "/categories/record_type/1"}],
      [I18n.t("activerecord.attributes.record.income"), INCOME,
        data: {children_path: "/categories/record_type/2"}],
      [I18n.t("activerecord.attributes.record.transfer"), TRANSFER,
        data: {children_path: "/categories/record_type/3"}],
    ]
  end

  private

  def set_from_wallet
    self.from_wallet = self.sub_category.try(:wallet) || self.category.try(:wallet)
  end

  def set_record_type
    self.record_type = self.category.try :record_type
  end

  def update_wallet
    wallet = self.from_wallet
    wallet.update price: wallet.price - self.price - self.commission
  end


end
