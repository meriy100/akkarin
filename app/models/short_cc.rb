class ShortCc < ActiveRecord::Base
  validates :user_id, :category_id, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_many :short_cps
end
