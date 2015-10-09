json.array!(@short_ccs) do |short_cc|
  json.extract! short_cc, :id, :user_id, :category_id, :sub_category_id
  json.url short_cc_url(short_cc, format: :json)
end
