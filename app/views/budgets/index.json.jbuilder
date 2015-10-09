json.array!(@budgets) do |budget|
  json.extract! budget, :id, :name, :user_id, :category_id, :sub_category_id, :price, :started_date, :finished_date, :remarks
  json.url budget_url(budget, format: :json)
end
