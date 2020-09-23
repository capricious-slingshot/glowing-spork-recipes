class ApplicationController < ActionController::Base
  protect_from_forgery with: :exceptions
  before_action :set_nav_variable
  helper_method :current_user
  helper_method :current_user?

  def set_nav_variable
    @styles = Style.all
  end

  private

  def current_user
    #memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_path, alert: "Log In to Proceed"
    end
  end

  def current_user?(user)
    current_user == user
  end
end
