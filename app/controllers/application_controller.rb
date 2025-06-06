class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    # Memoize current_user so it doesn't query the DB every time
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path, alert: "Please log in first" unless current_user
  end
end
