class Salary < ActiveRecord::Base
  validates :user_id, :price, :wallet_id, presence: true
  belongs_to :user
  belongs_to :wallet
end
