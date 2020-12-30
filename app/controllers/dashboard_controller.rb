class DashboardController < ApplicationController
  def show
#     client_id = '8d3750d227ee726082cf'
#     client_secret = '307b171e87a8ea5fdb4523f07dcf6f43c6f8ba30'
#     code = params[:code]
# # binding.pry
#     conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
#
#     response = conn.post('/login/oauth/access_token') do |req|
#       req.params['code'] = code
#       req.params['client_id'] = client_id
#       req.params['client_secret'] = client_secret
#     end
# # binding.pry
#     data = JSON.parse(response.body, symbolize_names: true)
#     access_token = data[:access_token]
# # binding.pry
#     conn = Faraday.new(
#       url: 'https://api.github.com',
#       headers: { 'Authorization': "token #{access_token}"
#       }
#     )
#     response = conn.get('/user')
#     data = JSON.parse(response.body, symbolize_names: true)
#     # binding.pry
#     user = User.find_or_create_by(uid: data[:id])
#     user.username = data[:login]
#     user.uid = data[:id]
#     user.token = access_token
#     user.save

# binding.pry
    repo_response = Faraday.get(
      "https://api.github.com/user/repos",
      {},
      {"Authorization": "token #{current_user.token}"}
    )
    @repos = JSON.parse(repo_response.body, symbolize_names: true)
  end
end
