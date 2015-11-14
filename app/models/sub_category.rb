class SubCategory < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :wallet
  has_many :expense_items
  has_many :records
  has_many :short_ccs
  has_many :budgets
  accepts_nested_attributes_for :short_ccs, :allow_destroy => true


  def set_user
    self.user = self.category.user
    self.save!
  end

  def get_color
    self.category.color
  end
end
