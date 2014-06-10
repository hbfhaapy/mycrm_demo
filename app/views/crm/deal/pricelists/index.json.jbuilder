json.array!(@crm_deal_pricelists) do |crm_deal_pricelist|
  json.extract! crm_deal_pricelist, :id, :content, :dealed, :deal_id, :user_id, :contact_id
  json.url crm_deal_pricelist_url(crm_deal_pricelist, format: :json)
end
