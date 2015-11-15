class ExpenseItem < ActiveRecord::Base
  validates :user_id, :category_id, :price, :date, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  belongs_to :wallet

#  before_save :update_wallet
#
#  after_validation :set_wallet_id, if: "wallet.blank?"

  scope :weekly_expenses, -> {where(date: 7.days.ago..Date.today)}

  def self.dates_split week
    week.map do |date|
      [date, self.search(date_eq: date).result]
    end
  end

  def self.column
    column_data = self.all.group_by{|i| i.category}.map do |category, _|
      category_items = self.where category: category
      data = Hash[*category_items.group_by{|i| i.date}.map { |date, _|
       [I18n.l(date), category_items.where(date: date).sum(:price)]
      }.flatten]
      {name: category.name, data: data}
    end
    column_data.sort_by{|category| category[:data].first.first}
  end

  def self.category_pie
    self.all.group_by{|item| item.category}.map do |category, _|
      [category.name, self.where(category: category).sum(:price) ]
    end
  end

  def update_wallet
    wallet = self.get_wallet
    wallet.price = wallet.price - self.price
    wallet.save
  end

  def get_wallet
  # self.wallet || self.sub_category.try(:wallet) || self.category.wallet
  end

  private
  def set_wallet_id
  # self.wallet = self.get_wallet
  end

end
