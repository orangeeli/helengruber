class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    if !current_user
      flash[:warning] = "Action not permitted."
      redirect_to root_url 
    end
  end

end
