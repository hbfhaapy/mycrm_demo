json.array!(@cm_contracts) do |cm_contract|
  json.extract! cm_contract, :id, :name, :amount, :actual_amount, :status_id, :agent_id, :signed_at, :started_at, :company_id, :plan_id, :user_id
  json.url cm_contract_url(cm_contract, format: :json)
end
