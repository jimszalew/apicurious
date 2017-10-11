class DashboardController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = ["token #{ENV['GITHUB_ACCESS_TOKEN']}"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/user")
    raw_user = JSON.parse(response.body, symbolize_names: true)

    @dashboard = UserDashboard.new(raw_user)
  end

  private
      attr_reader :conn
end
