class Transfer < ActiveRecord::Base
  validates :user_id, :price, :from_date, :to_date, presence: true
  belongs_to :user
end
