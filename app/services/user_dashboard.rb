class UserDashboard
  def initialize(user)
    @profile_pic = user[:avatar_url]
  end

  def profile_pic
    @profile_pic
  end
end
