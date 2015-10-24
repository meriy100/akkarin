class ShortCc < ActiveRecord::Base
# validates :user_id, :category_id, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_many :short_cps, dependent: :destroy
  accepts_nested_attributes_for :short_cps, :allow_destroy => true

  after_save :set_user, if: ->{!self.user.present?}
  after_save :set_category, if: ->{!self.category.present?}

  def set_user
    self.user = self.sub_category.try(:user) || self.sub_category.try(:category).try(:user)
    self.save
  end

  def set_category
    self.category = self.sub_category.try(:category)
    self.save
  end

end
