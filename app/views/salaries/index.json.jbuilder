json.array!(@salaries) do |salary|
  json.extract! salary, :id, :name, :user_id, :price, :remarkds, :wallets_id
  json.url salary_url(salary, format: :json)
end
