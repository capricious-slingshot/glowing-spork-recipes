class ApplicationController < ActionController::Base
  protect_from_forgery with: :exceptions
  helper_method :current_user
  helper_method :current_user?
  helper_method :authorized_user?

  private

  def current_user
    #memoization
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_path, alert: "Log In to Proceed"
    end
  end

   def current_user_admin?
     current_user && current_user.admin?
   end

  def require_admin
    unless current_user_admin?
      redirect_to root_path, alert: "Unauthorized Access"
    end
  end

  def authorized_user?(user)
    current_user?(user) || current_user_admin?
  end
end
