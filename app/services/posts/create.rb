module Posts
  class Create < ::BaseService
    def initialize(user:, video_id:)
      super()
      @user = user
      @video_id = video_id
    end

    def call
      valid = validate
      return unless valid

      get_success, video_details = get_video_details
      return unless get_success

      create_post(video_details)
    end

    private

    def validate
      @post = @user.posts.new(video_id: @video_id)

      if !@post.valid?
        add_error(StandardError.new('User uploaded duplicate video'))
        return false
      end

      return true
    end

    def get_video_details
      service = Youtube::GetDetails.new(video_id: @video_id)
      service.call

      if service.success?
        return true, service.data
      else
        add_error(StandardError.new('Failed to get video details'))
        return false, nil
      end
    end

    def create_post(video_details)
      @post.assign_attributes(
        title: video_details[:details][:title], description: video_details[:details][:description],
        thumbnail_url: video_details[:details][:thumbnail_url], embed_html: video_details[:embed_html]
      )

      unless @post.save
        add_error(StandardError.new('Failed to create post'))
      end
    end
  end
end
