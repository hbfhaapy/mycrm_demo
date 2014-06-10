json.array!(@fm_incomes) do |fm_income|
  json.extract! fm_income, :id, :amount, :time, :note, :collection_id, :company_id, :user_id
  json.url fm_income_url(fm_income, format: :json)
end
