class Repo
  attr_reader :name, :private, :url
  def initialize(data)
    @name = data[:name]
    @private = data[:private]
    @url = data[:html_url]
  end
end
