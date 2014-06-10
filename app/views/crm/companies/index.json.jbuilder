json.array!(@crm_companies) do |crm_company|
  json.extract! crm_company, :id, :name, :category_id, :zipcode, :mail, :note, :image, :user_id
  json.url crm_company_url(crm_company, format: :json)
end
