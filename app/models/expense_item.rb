class ExpenseItem < ActiveRecord::Base
  validates :user_id, :category_id, :price, :date, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  belongs_to :wallet

  before_save :update_wallet


  def update_wallet
    wallet = self.get_wallet
    wallet.price = wallet.price - self.price
    wallet.save
  end

  def get_wallet
    self.wallet || self.sub_category.try(:wallet) || self.category.wallet
  end

end
