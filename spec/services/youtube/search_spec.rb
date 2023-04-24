require 'rails_helper'
require 'set_env'

RSpec.describe Youtube::Search do
  let(:service) { described_class.new(query: query, page_token: page_token) }
  let(:query) { 'abc' }
  let(:page_token) { '123' }

  describe '.call' do
    let(:youtube_response) { build(:youtube_response, :search) }
    before do
      allow(HTTParty).to receive(:get).and_return(youtube_response)
    end

    it 'calls youtube API with correct params' do
      service.call

      expect(HTTParty).to have_received(:get) do |youtube_url|
        path, params = youtube_url.split('?')

        expect(path).to eql("https://youtube.googleapis.com/youtube/v3/search")
        expect(params.split('&')).to match_array([
          'key=api_key', 'q=abc', 'part=snippet', 'type=video', 'max_results=10', 'page_token=123'
        ])
      end
      expect(service.success?).to be true
    end

    context 'success' do
      it 'extracts and return needed data' do
        service.call

        expect(service.success?).to be true
        expect(service.data[:next_page_token]).to eql('CAoQAA')
        expect(service.data[:data][0]).to eql({
          description: 'ABC Song | Learn ABC Alphabet for Children | Education ABC Nursery Rhymes ABC Alphabet Song Lyrics: ...',
          title: 'ABC Song | Learn ABC Alphabet for Children | Education ABC Nursery Rhymes',
          video_id: 'ezmsrB59mj8',
          thumbnail_url: 'https://i.ytimg.com/vi/ezmsrB59mj8/mqdefault.jpg'
        })
        expect(service.data[:data].count).to eql(10)
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
