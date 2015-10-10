json.array!(@categories) do |category|
  json.extract! category, :id, :name, :color_id, :user_id, :wallet_id
  json.url category_url(category, format: :json)
end
