class ShortCp < ActiveRecord::Base
  validates :user_id, :price, presence: true
  belongs_to :short_cc
  belongs_to :user
end
