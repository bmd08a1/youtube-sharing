module SessionsHelper
  class UnauthorizedError < StandardError; end

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

  def require_login!
    unless logged_in?
      raise UnauthorizedError.new
    end
  end
end
