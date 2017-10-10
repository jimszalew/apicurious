class User < ApplicationRecord
  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(uid: auth['id'])

    user.name               = auth["info"]["name"]
    user.username           = auth["info"]["nickname"]
    user.oauth_token        = auth["credentials"]["token"]
    user.save
    user
  end
end
