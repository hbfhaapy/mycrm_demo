json.array!(@crm_phones) do |crm_phone|
  json.extract! crm_phone, :id, :klass_id, :number, :phoneable_id, :phoneable_type
  json.url crm_phone_url(crm_phone, format: :json)
end
