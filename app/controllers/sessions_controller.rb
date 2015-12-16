class SessionsController < ApplicationController

  def create
    #render text: request.env["omniauth.auth"].inspect
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to home_path
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
