class UserDashboard

  def initialize(user)
    @user = user
  end

  def profile_pic
    dashboard[:avatar_url]
  end

  def followers
    dashboard[:followers]
  end

  def following
    dashboard[:following]
  end

  def dashboard
    GithubService.new.dashboard(user)
  end

  def repos
    GithubService.new.repos(user).map do |repo|
      Repository.new(repo)
    end
  end

  private
      attr_reader :user
end
