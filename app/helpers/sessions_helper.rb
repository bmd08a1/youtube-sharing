module SessionsHelper
  def login(user)
    session[:current_user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.delete(:current_user_id)
    @current_user = nil
  end
end
