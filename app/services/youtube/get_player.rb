# frozen_string_literal: true

module Youtube
  class GetPlayer < ::BaseService
    ENDPOINT = 'https://www.googleapis.com/youtube/v3/videos'
    API_KEY = ENV['YOUTUBE_API_KEY']
    PLAYER = 'player'
    SNIPPET = 'snippet'
    MAX_WIDTH = 1000

    def initialize(video_id:)
      super()
      @video_id = video_id
      @data = {}
    end

    def call
      full_url = build_url
      response = HTTParty.get(full_url)

      if response.code == 200
        response_body = JSON.parse(response.body)
        video_obj = response_body['items'][0]

        @data[:embed_html] = video_obj['player']['embedHtml']
        @data[:details] = {
          title: video_obj['snippet']['title'],
          description: video_obj['snippet']['description']
        }
      else
        add_error(StandardError.new(response.body))
      end
    end

    private

    def build_url
      params = {
        key: API_KEY,
        part: PLAYER,
        'part' => SNIPPET,
        id: @video_id,
        maxWidth: MAX_WIDTH
      }

      ENDPOINT + "?#{params.to_query}"
    end
  end
end
