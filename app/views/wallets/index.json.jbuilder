json.array!(@wallets) do |wallet|
  json.extract! wallet, :id, :name, :user_id, :price
  json.url wallet_url(wallet, format: :json)
end
