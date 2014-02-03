class SessionsController < ApplicationController
  force_ssl
  def index
    redirect_to new_session_path
  end

  def new
  end

  def create

    user = User.find_by_email(params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end

  end

  def destroy
        session[:user_id] = nil
        redirect_to root_url, :notice => "Logged out!"
  end
end
