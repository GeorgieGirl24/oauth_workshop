class SessionsController < ApplicationController
  def create
    client_id = '8d3750d227ee726082cf'
    client_secret = '307b171e87a8ea5fdb4523f07dcf6f43c6f8ba30'
    code = params[:code]

    conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})

    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    data = JSON.parse(response.body, symboize_names: true)
    access_token = data[:access_token]

    conn = Faraday.new(
      url: 'https://api.github.com',
      headers: { 'Authorization': "token#{access_token}"
      }
    )
    response = conn.get('/user')
    data = JSON.parse(response.body, symboize_names: true)
    binding.pry
  end
end
