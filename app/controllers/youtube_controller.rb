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

  def get_player
    service = Youtube::GetPlayer.new(video_id: params[:video_id])
    service.call

    if service.success?
      @embed_html = service.data[:embed_html]
      @details = service.data[:details]

      render 'get_player', layout: false
    else
    end
  end
end
