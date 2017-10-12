class DashboardController < ApplicationController
  def index
    @dashboard = UserDashboard.new(current_user)
  end
end
