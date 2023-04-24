require 'rails_helper'

RSpec.describe Posts::Create do
  let(:service) { described_class.new(user: user, video_id: video_id) }
  let(:video_id) { 'abc' }
  let(:user) { create(:user) }

  describe '.call' do
    let(:get_details_service) { double(call: nil, success?: get_success, data: get_details_response) }
    let(:get_success) { true }
    let(:get_details_response) {
      {
        embed_html: 'embed_html',
        details: {
          title: 'vid',
          thumbnail_url: 'thumbnail_url',
          description: 'description'
        }
      }
    }

    before do
      allow(Youtube::GetDetails).to receive(:new).and_return(get_details_service)
    end

    it 'calls Youtube::GetDetails' do
      service.call

      expect(Youtube::GetDetails).to have_received(:new).with(video_id: 'abc')
      expect(get_details_service).to have_received(:call)
    end

    context 'success' do
      it 'creates a new post' do
        expect{ service.call }.to change{ Post.where(user: user).count }.by(1)
        expect(service.success?).to be true
      end

      it 'creates post with correct attributes' do
        service.call

        post = Post.last
        expect(post.video_id).to eql('abc')
        expect(post.user_id).to eql(user.id)
        expect(post.title).to eql('vid')
        expect(post.description).to eql('description')
        expect(post.embed_html).to eql('embed_html')
        expect(post.thumbnail_url).to eql('thumbnail_url')
      end
    end

    context 'failed' do
      context 'duplicate video' do
        let!(:old_post) { create(:post, user: user, video_id: 'abc') }

        it 'does not create new post' do
          expect{ service.call }.to_not change{ Post.where(user_id: user.id).count }
        end

        it 'returns error' do
          service.call

          expect(service.success?).to be false
          expect(service.error_messages).to include('User uploaded duplicate video')
        end
      end

      context 'get video details failed' do
        let!(:get_success) { false }

        it 'does not create new post' do
          expect{ service.call }.to_not change{ Post.where(user_id: user.id).count }
        end

        it 'returns error' do
          service.call

          expect(service.success?).to be false
          expect(service.error_messages).to include('Failed to get video details')
        end
      end

      context 'failed to create video' do
        before do
          allow_any_instance_of(Post).to receive(:save).and_return(false)
        end

        it 'does not create new post' do
          expect{ service.call }.to_not change{ Post.where(user_id: user.id).count }
        end

        it 'returns error' do
          service.call

          expect(service.success?).to be false
          expect(service.error_messages).to include('Failed to create post')
        end
      end
    end
  end
end
