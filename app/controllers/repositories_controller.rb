class RepositoriesController < ApplicationController
  def index
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = ["token #{ENV['GITHUB_ACCESS_TOKEN']}"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/user/repos?per_page=100")
    raw_repos = JSON.parse(response.body, symbolize_names: true)

    @repos = raw_repos.map do |repo|
      Repository.new(repo)
    end
  end
end
