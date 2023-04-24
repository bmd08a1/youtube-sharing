require 'rails_helper'

RSpec.describe 'Visit posts page', js: true do
  let(:user) { create(:user, name: 'dung', email: 'bmd08a1@gmail.com') }
  let!(:post) { create(:post, user: user, video_id: 'xN3VHGxFMDE', title: 'Video title', description: 'description',
                      thumbnail_url: 'https://i.ytimg.com/vi/xN3VHGxFMDE/mqdefault.jpg',
                      embed_html: "<iframe width=\"1000\" height=\"563\" src=\"https://www.youtube.com/embed/xN3VHGxFMDE\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>") }

  it 'loads post' do
    visit root_path

    expect(page).to have_selector('.videos')
    within('.videos') do
      expect(find('.video .title').text(:all)).to eql("Video title")
      expect(find('.video .description').text(:all)).to eql("Description: description")
      expect(find('.video .thumbnail img')['src']).to eql("https://i.ytimg.com/vi/xN3VHGxFMDE/mqdefault.jpg")
      expect(find('.video .shared-by').text(:all)).to eql("Shared by: dung (bmd08a1@gmail.com)")
    end
  end

  it 'previews shared video when clicked' do
    visit root_path

    within('.videos') do
      first('.video').click
      sleep(1)
    end

    within('.modal') do
      expect(page).to have_selector('.video-player')
      expect(page).to have_selector('.details')
      expect(page).to have_selector('.title')
      expect(page).to have_selector('.description')

      expect(find('.title').text(:all)).to eql('Video title')
    end
  end
end
