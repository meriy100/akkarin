class ShortCp < ActiveRecord::Base
  validates :price, presence: true
  belongs_to :short_cc
  belongs_to :user
end
