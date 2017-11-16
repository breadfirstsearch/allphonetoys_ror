json.extract! user, :id, :name, :email, :phone, :password, :pref_provider, :pref_amount, :pref_location, :created_at, :updated_at
json.url user_url(user, format: :json)
