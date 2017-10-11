class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = user.id

    redirect_to dashboard_index_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
