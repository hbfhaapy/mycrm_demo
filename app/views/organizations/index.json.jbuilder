json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :parent_id, :lft, :rgt, :depth
  json.url organization_url(organization, format: :json)
end
