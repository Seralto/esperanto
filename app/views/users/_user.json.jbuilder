json.extract! user, :id, :name, :birthdate, :gender, :email, :level, :share_information, :created_at, :updated_at
json.url user_url(user, format: :json)
