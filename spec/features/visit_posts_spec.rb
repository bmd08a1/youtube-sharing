require 'rails_helper'

RSpec.describe 'Visit posts page', js: true do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user, video_id: 'xN3VHGxFMDE', title: 'Video title',
                      thumbnail_url: 'https://i.ytimg.com/vi/xN3VHGxFMDE/mqdefault.jpg',
                      embed_html: "<iframe width=\"1000\" height=\"563\" src=\"https://www.youtube.com/embed/xN3VHGxFMDE\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>") }

  it 'loads post' do
    visit root_path

    sleep(3)

    within('.posts-container') do
      expect(page).to have_content('Video title')
    end
  end
end
