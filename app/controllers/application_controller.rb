class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  before_filter :log_in 

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def log_in
    user = current_user
    unless user
      redirect_to log_in_path
    end
  end
end
