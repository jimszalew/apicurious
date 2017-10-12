class GithubService
  def initialize
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = ["token #{ENV['MASTER_TOKEN']}"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def dashboard(user)
    response = conn.get("/user")
    JSON.parse(response.body, symbolize_names: true)
  end

  def repos(user)
    response = conn.get("/user/repos?per_page=100")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
      attr_reader :conn
end
