json.array!(@admin_foos) do |admin_foo|
  json.extract! admin_foo, :username, :name, :email, :password
  json.url admin_foo_url(admin_foo, format: :json)
end
