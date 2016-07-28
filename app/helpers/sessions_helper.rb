module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def remember(user)
    user.remember
    cookies.signed[:user_id] = {value: user.id, expires: 7.days.from_now.utc}
    cookies[:remember_token] = {value: user.remember_token, expires: 7.days.from_now.utc}
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    !current_user.nil?
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
