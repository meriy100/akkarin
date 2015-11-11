FactoryGirl.define do
  factory :transfer do
    price 1000
    from_wallet_id 2
    to_wallet_id 1
    date Date.new(2010, 01, 21)
  end
end
