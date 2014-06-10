json.array!(@crm_activities) do |crm_activity|
  json.extract! crm_activity, :id, :name, :status_id, :category_id, :user_id, :note, :activityable_id, :activityable_type, :time, :person_id
  json.url crm_activity_url(crm_activity, format: :json)
end
