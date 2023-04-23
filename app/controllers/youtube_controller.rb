class YoutubeController < ApplicationController
  def search
    service = Youtube::Search.new(query: params[:query], page_token: params[:page_token])
    service.call

    if service.success?
      @videos_data = service.data[:data]
      @next_page_token = service.data[:next_page_token]

      render 'search', layout: false
    else
      head 500
    end
  end
end
