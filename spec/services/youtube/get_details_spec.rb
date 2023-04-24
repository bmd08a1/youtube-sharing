require 'rails_helper'
require 'set_env'

RSpec.describe Youtube::GetDetails do
  let(:service) { described_class.new(video_id: video_id) }
  let(:video_id) { 'abc' }

  describe '.call' do
    let(:youtube_response) { build(:youtube_response, :get_details) }
    before do
      allow(HTTParty).to receive(:get).and_return(youtube_response)
    end

    it 'calls youtube API with correct params' do
      service.call

      expect(HTTParty).to have_received(:get) do |youtube_url|
        path, params = youtube_url.split('?')

        expect(path).to eql("https://youtube.googleapis.com/youtube/v3/videos")
        expect(params.split('&')).to match_array([
          'key=api_key', 'id=abc', 'part=snippet', 'part=player', 'maxWidth=1000'
        ])
      end
      expect(service.success?).to be true
    end

    context 'success' do
      it 'extracts and return needed data' do
        service.call

        expect(service.success?).to be true
        expect(service.data[:embed_html]).to include("https://www.youtube.com/embed/xxM1kfj4nq8")
        expect(service.data[:embed_html]).to include("iframe")

        expect(service.data[:details][:description]).to include("#TheBROS #SoulofTheForest #FlamingoDaiLai #acoustic #cover #coversong #coversongs #trungquan")
        expect(service.data[:details][:title]).to eql("CÔ ĐƠN TRÊN SOFA | Hồ Ngọc Hà x Tăng Duy Tân | Trung Quân live cover at #souloftheforest")
        expect(service.data[:details][:thumbnail_url]).to eql("https://i.ytimg.com/vi/xxM1kfj4nq8/mqdefault.jpg")
      end
    end

    context 'failed' do
      let(:youtube_response) { build(:youtube_response, code: 300, body: 'Failed') }

      it 'returns error' do
        service.call

        expect(service.success?).to be false
        expect(service.error_messages).to include('Failed')
      end
    end
  end
end
