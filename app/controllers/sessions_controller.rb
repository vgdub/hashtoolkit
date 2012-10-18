class SessionsController < ApplicationController

  
  def create
    #raise env["omniauth.auth"].to_yaml
    auth_response = env["omniauth.auth"]
    user = User.from_omniauth( auth_response )


    session[:user_oauth_token] = auth_response["credentials"]["token"]
    session[:user_oauth_secret] = auth_response["credentials"]["secret"]

    session[:user_id] = user.user_id
    flash[:success] = "Signed In!"
    redirect_to user_path() # user_path(user)
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Signed out!"
    redirect_to root_url
  end

end
