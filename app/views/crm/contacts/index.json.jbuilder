json.array!(@crm_contacts) do |crm_contact|
  json.extract! crm_contact, :id, :name, :category_id, :company_id, :user_id, :mail, :qq, :msn, :job, :note, :image, :status_id
  json.url crm_contact_url(crm_contact, format: :json)
end
