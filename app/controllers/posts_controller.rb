class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    service = Posts::Create.new(user: current_user, video_id: params[:video_id])
    service.call

    if service.success?
      flash[:success] = 'Youtube video shared'
      head :ok
    else
      head 500
    end
  end
end
