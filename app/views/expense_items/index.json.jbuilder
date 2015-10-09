json.array!(@expense_items) do |expense_item|
  json.extract! expense_item, :id, :name, :user_id, :category_id, :sub_category_id, :price, :remarks, :wallet_id
  json.url expense_item_url(expense_item, format: :json)
end
