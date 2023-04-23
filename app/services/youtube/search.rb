# frozen_string_literal: true

module Youtube
  class Search < ::BaseService
    ENDPOINT = 'https://youtube.googleapis.com/youtube/v3/search'
    API_KEY = ENV['YOUTUBE_API_KEY']
    SNIPPET = 'snippet'
    VIDEO = 'video'
    MAX_RESULTS = 10

    def initialize(query:, page_token:)
      super()
      @query = query
      @page_token = page_token
      @data = {}
    end

    def call
      full_url = build_url
      response = HTTParty.get(full_url)

      if response.code == 200
        response_body = JSON.parse(response.body)
        @data[:data] = extract_data(response_body['items'])
        @data[:next_page_token] = response_body['nextPageToken']
      else
        add_error(StandardError.new(response.body))
      end
    end

    private

    def build_url
      params = {
        key: API_KEY,
        q: @query,
        part: SNIPPET,
        type: VIDEO,
        max_results: MAX_RESULTS
      }
      params.merge!(page_token: @page_token) if @page_token.present?

      ENDPOINT + "?#{params.to_query}"
    end

    def extract_data(response_data)
      response_data.map do |datum|
        {
          video_id: datum['id']['videoId'],
          title: datum['snippet']['title'],
          description: datum['snippet']['description'],
          thumbnail_url: datum['snippet']['thumbnails']['medium']['url']
        }
      end
    end
  end
end
