FactoryGirl.define do
  factory :record do
    user_id 1
    price 1000
    from_wallet_id 2
    to_wallet_id 1
    date Date.new(2010, 01, 21)
    category_id 1

    factory :invalid_record do
      date nil
    end
  end

  factory :type_payment, parent: :record do
    category_id 1
  end

  factory :type_income, parent: :record do
    category_id 3
  end

  factory :type_transfer, parent: :record do
    category_id 4
  end
end
