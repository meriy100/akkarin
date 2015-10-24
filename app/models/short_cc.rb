class ShortCc < ActiveRecord::Base
  validates :user_id, :category_id, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_many :short_cps
  accepts_nested_attributes_for :short_cps, :allow_destroy => true

  before_validation :set_user

  def set_user
  #  self.user = self.sub_category.try(:user) || self.category.user
  end


end
