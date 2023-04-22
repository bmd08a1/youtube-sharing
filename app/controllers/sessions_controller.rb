class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:delete]

  def new
  end

  def create
    user = User.find_by(email: login_params[:email])

    if user && user.authenticate(login_params[:password])
      login user
      redirect_to posts_path
    else
      flash.now[:danger] = "Invalid email/password"
      render 'new'
    end
  end

  def delete
    logout
    head :ok
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
