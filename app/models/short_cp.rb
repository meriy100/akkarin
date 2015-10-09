class ShortCp < ActiveRecord::Base
  validates :short_cc_id, :user_id, :price, presence: true
  belongs_to :short_cc
  belongs_to :user
end
