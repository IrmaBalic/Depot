json.array!(@logins) do |login|
  json.extract! login, :id, :role_id, :name, :password
  json.url login_url(login, format: :json)
end
