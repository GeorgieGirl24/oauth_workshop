class RepoService
  def self.conn(current_user)
    Faraday.new(url: 'https://api.github.com', headers: { 'Authorization': "token #{current_user.token}"})
  end

  def self.private_repos(current_user)
    response = conn(current_user).get('/user/repos?per_page=100&type=private')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.public_repos(current_user)
    response = conn(current_user).get('/user/repos?per_page=100&type=public')
    JSON.parse(response.body, symbolize_names: true)
  end
end
