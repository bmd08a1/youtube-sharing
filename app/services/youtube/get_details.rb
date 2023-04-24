# frozen_string_literal: true

module Youtube
  class GetDetails < ::BaseService
    ENDPOINT = 'https://youtube.googleapis.com/youtube/v3/videos'
    API_KEY = ENV['YOUTUBE_API_KEY']
    SCOPES = [
      PLAYER = 'player',
      SNIPPET = 'snippet'
    ].freeze
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
        @data[:details] = extract_data(video_obj['snippet'])
      else
        add_error(StandardError.new(response.body))
      end
    end

    private

    def build_url
      params = {
        key: API_KEY,
        id: @video_id,
        maxWidth: MAX_WIDTH
      }
      request_params = params.to_query + SCOPES.map{ |scope| "&part=#{scope}" }.join('')

      ENDPOINT + "?#{request_params}"
    end

    def extract_data(video_snippet)
      {
        title: video_snippet['title'],
        description: video_snippet['description'],
        thumbnail_url: video_snippet['thumbnails']['medium']['url'],
      }
    end
  end
end
