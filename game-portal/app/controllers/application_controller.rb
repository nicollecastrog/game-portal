class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    alert_message = case 
    when current_user
      "You do not have permission to do that"
    else
      'You must sign up or log in to use this feature.'
    end
    redirect_to root_path, alert: alert_message
  end

  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:user_id)
      return nil
    end
  end
end
