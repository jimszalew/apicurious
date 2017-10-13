class Repository
  attr_reader :name,
              :description,
              :language

  def initialize(repo)
    @name        = repo[:name]
    @description = repo[:description]
    @language    = repo[:language]
    @updated     = repo[:updated_at]
  end

  def updated
    (DateTime.now - DateTime.parse(@updated)).to_i
  end

  private
      attr_reader :user
end
