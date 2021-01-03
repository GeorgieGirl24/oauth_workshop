class SessionsController < ApplicationController
  def create
    data = SearchFacade.access(params[:code])
    access_token = data[:access_token]

    user_data = SearchFacade.user_access(access_token)

    user = User.find_or_create_by(uid: user_data[:id])
    user.username = user_data[:login]
    user.uid = user_data[:id]
    user.token = access_token
    user.save

    session[:user_id] = user.id

    redirect_to dashboard_path
  end

end
