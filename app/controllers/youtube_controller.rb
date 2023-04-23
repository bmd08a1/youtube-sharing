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
    service = Youtube::GetDetails.new(
      video_id: params[:video_id],
      scopes: [Youtube::GetDetails::SNIPPET, Youtube::GetDetails::PLAYER]
    )
    service.call

    if service.success?
      @embed_html = service.data[:embed_html]
      @details = service.data[:details]
      @video_id = params[:video_id]

      render 'get_player', layout: false
    else
      head 500
    end
  end
end
