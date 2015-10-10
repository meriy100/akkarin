json.array!(@transfers) do |transfer|
  json.extract! transfer, :id, :user_id, :price, :form_wallet_id, :to_wallet_id, :commission
  json.url transfer_url(transfer, format: :json)
end
