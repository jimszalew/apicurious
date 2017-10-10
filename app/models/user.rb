class User < ApplicationRecord
  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(uid: auth['id'])

    user.name               = auth["info"]["name"]
    user.username           = auth["info"]["nickname"]
    user.profile_picture    = auth["extra"]["raw_info"]["avatar_url"]
    user.oauth_token        = auth["credentials"]["token"]
    user.save
    user
  end
end
