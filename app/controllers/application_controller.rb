class ApplicationController < ActionController::Base
  include SessionsHelper

  rescue_from UnauthorizedError, with: :redirect_to_login

  def redirect_to_login
    respond_to do |format|
      format.html {
        flash[:danger] = 'Login required'
        redirect_to login_path and return
      }
      format.js { head 401 }
    end
  end
end
