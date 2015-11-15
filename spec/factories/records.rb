FactoryGirl.define do
  factory :record do
    user_id 1
    price 1000
    from_wallet_id 2
    to_wallet_id 1
    date Date.new(2010, 01, 21)
    category_id 1

    factory :invalid do
    end
  end

end
