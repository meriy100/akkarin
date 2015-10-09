json.array!(@shot_cps) do |shot_cp|
  json.extract! shot_cp, :id, :short_cc_id, :user_id, :price
  json.url shot_cp_url(shot_cp, format: :json)
end
