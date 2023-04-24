class PostsController < ApplicationController
  before_action :require_login!, only: [:new, :create]

  PAGE_LIMIT = 10
  DEFAULT_PAGE = 0

  def index
  end

  def filter
    total_count = Post.count
    page = params[:page].to_i || DEFAULT_PAGE

    @posts = Post.includes(:user).all.limit(PAGE_LIMIT).offset(page * PAGE_LIMIT)
    @can_load_more = (page + 1) * PAGE_LIMIT < total_count

    render 'filter', layout: false
  end

  def show
    @post = Post.find(params[:id])

    render 'show', layout: false
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
