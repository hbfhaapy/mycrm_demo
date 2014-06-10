json.array!(@cm_collections) do |cm_collection|
  json.extract! cm_collection, :id, :name, :percent, :time, :contact_id, :user_id_id
  json.url cm_collection_url(cm_collection, format: :json)
end
