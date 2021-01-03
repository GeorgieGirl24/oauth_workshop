class AccessService
  def self.response(code)
    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      # req.params['client_id'] = ENV['GITHUB_CLIENT_ID']
      req.params['client_id'] = '8d3750d227ee726082cf'
      # req.params['client_secret'] = ENV['GITHUB_CLIENT_SECRET']
      req.params['client_secret'] = '307b171e87a8ea5fdb4523f07dcf6f43c6f8ba30'
    end
    get_parsed(response)
  end

  def self.user_access(access_token)
    response = conn1(access_token).get('/user')
    get_parsed(response)
  end

  private

  def self.get_parsed(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn1(access_token)
    Faraday.new(
      url: 'https://api.github.com',
      headers: { 'Authorization': "token #{access_token}"
      }
    )
  end

  def self.conn
    Faraday.new(url: 'https://github.com', headers: { 'Accept': 'application/json' })
  end
end
