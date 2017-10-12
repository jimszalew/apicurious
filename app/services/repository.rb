class Repository
  attr_reader :name,
              :description,
              :language,
              :updated

  def initialize(repo)
    @name        = repo[:name]
    @description = repo[:description]
    @language    = repo[:language]
    @updated     = repo[:updated_at]
  end

  private
      attr_reader :user
end
