json.extract! user, :id, :name, :firstchild, :secondchild, :thirdchild, :password_digest, :email, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
