json.extract! client, :id, :name, :location, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
