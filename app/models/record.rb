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

  validates :user_id, :record_type, :price, :date, :category_id, presence: true
  validates :from_wallet_id, presence: true, if: Proc.new{|r| r.record_type != INCOME}
  validates :to_wallet_id, presence: true, if: Proc.new{|r| r.record_type != PAYMENT}

  before_validation :set_from_wallet, if: "from_wallet.blank?"
  before_validation :set_record_type, if: "record_type.blank?"


  before_update :reset_wallet
  before_destroy :reset_wallet
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

  def reset_wallet
    if from = self.from_wallet.presence and self.record_type != INCOME
      from.update price: from.price + Record.find(self.id).price + Record.find(self.id).commission
    end

    if to = self.to_wallet.presence and self.record_type != PAYMENT
      to.update price: to.price - Record.find(self.id).price
    end
  end

  private

  def set_from_wallet
    self.from_wallet = self.sub_category.try(:wallet) || self.category.try(:wallet)
  end

  def set_record_type
    self.record_type = self.category.try :record_type
  end

  def update_wallet
    if self.record_type != INCOME
      from = self.from_wallet
      from.update price: from.price - self.price - self.commission
    end

    if self.record_type != PAYMENT
      to = self.to_wallet
      to.update price: to.price + self.price
    end
  end


end
