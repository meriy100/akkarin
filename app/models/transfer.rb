class Transfer < ActiveRecord::Base
  belongs_to :user
  belongs_to :from_wallet, class_name: "Wallet"
  belongs_to :to_wallet, class_name: "Wallet"
  validates :user_id, :price, :date, :from_wallet_id, :to_wallet_id, presence: true
  before_validation :set_commission, if: "commission.blank?"
  before_save :update_wallet

  private

  def set_commission
    self.commission = 0
  end

  def update_wallet
    from = self.from_wallet
    to = self.to_wallet
    from.price = from.price - self.price - self.commission
    to.price = to.price + self.price
    from.save
    to.save
  end

end
