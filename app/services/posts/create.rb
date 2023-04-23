module Posts
  class Create < ::BaseService
    def initialize(user:, video_id:)
      super()
      @user = user
      @video_id = video_id
    end

    def call
      video_details = get_video_details

      create_post(video_details)
    end

    private

    def get_video_details
      service = Youtube::GetDetails.new(
        video_id: @video_id,
        scopes: [Youtube::GetDetails::SNIPPET, Youtube::GetDetails::PLAYER]
      )
      service.call

      service.data
    end

    def create_post(video_details)
      post = Post.new(
        user: @user, title: video_details[:details][:title], description: video_details[:details][:description],
        video_id: @video_id, thumbnail_url: video_details[:details][:thumbnail_url],
        embed_html: video_details[:embed_html]
      )

      post.save
    end
  end
end
