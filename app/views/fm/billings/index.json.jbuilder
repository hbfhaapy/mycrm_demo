json.array!(@fm_billings) do |fm_billing|
  json.extract! fm_billing, :id, :amount, :time, :manager_id, :company_id, :collection_id, :user_id
  json.url fm_billing_url(fm_billing, format: :json)
end
