class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  has_secure_password

  has_many :wallets
  has_many :categories
  has_many :sub_categories
  has_many :expense_items
  has_many :short_ccs
  has_many :short_cps
  has_many :budgets
  has_many :salaries
  has_many :transfers
end
