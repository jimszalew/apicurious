class User < ApplicationRecord
  validates_presence_of :uid, :username, :oauth_token

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(uid: auth["uid"])

    user.username    = auth["info"]["nickname"]
    user.oauth_token = auth["credentials"]["token"]
    user.save
    user
  end
end
