class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    #TODO redirect_to LOGIN PATH if no current user
    redirect_to root_path if current_user.nil?
  end
  
end
