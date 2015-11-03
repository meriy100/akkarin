class Salary < ActiveRecord::Base
  validates :user_id, :price, :wallet_id, presence: true
  belongs_to :user
  belongs_to :wallet

  before_save :update_wallet

  def update_wallet
    wallet = self.wallet
    wallet.price = wallet.price + self.price
    wallet.save
  end

end
