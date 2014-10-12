json.array!(@admins) do |admin|
  json.extract! admin, :id, :name
  json.url admin_url(admin, format: :json)
end
