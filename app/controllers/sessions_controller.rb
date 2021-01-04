class SessionsController < ApplicationController
  def create
    data = SearchFacade.access(params[:code])
    access_token = data[:access_token]

    user_data = SearchFacade.user_access(access_token)
    user = User.find_or_create_user(auth_hash)
    if user
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
