class SubCategory < ActiveRecord::Base
  validates :name, :category_id, :user_id, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :wallet
  has_many :expense_items
  has_many :short_ccs
  has_many :budgets
  accepts_nested_attributes_for :short_ccs, :allow_destroy => true
  def get_color
    self.category.color
  end
end
