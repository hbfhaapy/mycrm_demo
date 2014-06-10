json.array!(@smartfinders) do |smartfinder|
  json.extract! smartfinder, :id, :url, :klass, :name, :user_id
  json.url smartfinder_url(smartfinder, format: :json)
end
