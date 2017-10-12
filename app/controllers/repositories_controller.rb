class RepositoriesController < ApplicationController
  def index
    @repos = UserDashboard.new(current_user).repos
  end
end
