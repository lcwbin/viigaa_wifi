json.array!(@users) do |user|
  json.extract! user, :id, :userid, :username, :password_digest, :nickname, :flow, :credits, :errorTime, :loginTime, :status
  json.url user_url(user, format: :json)
end
