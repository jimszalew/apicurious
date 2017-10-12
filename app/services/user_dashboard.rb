class UserDashboard
  attr_reader :profile_pic,
              :followers,
              :following

  def initialize(user)
    @profile_pic = user[:avatar_url]
    @followers   = user[:followers]
    @following   = user[:following]
  end
end
