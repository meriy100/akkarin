class ShortCp < ActiveRecord::Base
  validates :price, presence: true
  belongs_to :short_cc
  belongs_to :user

  before_validation :set_user

  def set_user
    self.user = self.short_cc.user
  end

end
