json.array!(@crm_addresses) do |crm_address|
  json.extract! crm_address, :id, :content, :addressable_id, :addressable_type
  json.url crm_address_url(crm_address, format: :json)
end
