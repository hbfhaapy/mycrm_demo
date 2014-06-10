json.array!(@crm_deals) do |crm_deal|
  json.extract! crm_deal, :id, :name, :status_id, :category_id, :amount, :company_id, :contact_id, :user_id, :time
  json.url crm_deal_url(crm_deal, format: :json)
end
