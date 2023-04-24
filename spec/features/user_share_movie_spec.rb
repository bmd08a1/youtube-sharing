require 'rails_helper'

def login(user)
  visit login_path
  fill_in 'session_email', with: user.email
  fill_in 'session_password', with: user.password

  click_button 'Log in'
end

def search(q)
  visit new_post_path

  find('input#search').set(q)
  find('#search-button').click
  sleep(1)
end

RSpec.describe 'User share movie', js: true do
  context 'logged in' do
    let!(:user) { create(:user) }
    before do
      login(user)
    end

    describe 'Visit share posts page' do
      it 'takes user to share posts page which have a video search bar' do
        visit root_path
        within('.header') do
          expect(page).to have_content 'Share a movie'
          click_link 'Share a movie'
        end

        expect(page).to have_current_path(new_post_path)
        expect(page).to have_selector('input#search')
      end
    end

    describe 'Search for video' do
      it 'returns search result from youtube' do
        search("dota")

        within('.videos') do
          expect(page).to have_selector('.video', count: 10)
        end
      end

      it 'loads more videos when user click load more' do
        search("dota")

        expect(page).to have_selector('.load-more')
        find('.load-more').click

        sleep(1)
        within('.videos') do
          expect(page).to have_selector('.video', count: 20)
        end
      end

      it 'clears search result when user search for new content' do
        search("dota")
        old_video_titles = []
        within('.videos') do
          old_video_titles = page.all(:css, '.video .title').map { |elem| elem.text(:all) }
        end

        search("LMHT")
        new_video_titles = []
        within('.videos') do
          new_video_titles = page.all(:css, '.video .title').map { |elem| elem.text(:all) }
        end

        expect(old_video_titles).to_not eql(new_video_titles)
      end
    end

    describe 'Share a video' do
      it 'creates new share posts and redirect user to root path' do
        search("dota")

        video_title = ''
        within('.videos') do
          video_title = first('.video .title').text(:all)
          first('.video').click
        end

        within('.modal') do
          expect(page).to have_selector('.video-player')
          expect(page).to have_selector('.details')
          expect(page).to have_selector('.title')
          expect(page).to have_selector('.description')

          expect(find('.title').text(:all)).to eql(video_title)

          find('#share').click
          sleep(1)
        end

        expect(page).to have_current_path(root_path)
        within('.flash-success') do
          expect(page).to have_content('Youtube video shared')
        end

        within('.videos') do
          expect(first('.video .title').text(:all)).to eql(video_title)
        end
      end
    end
  end

  context 'not logged in' do
    it 'redirects user to login path' do
      visit new_post_path

      expect(page).to have_current_path(login_path)
      within('.flash-danger') do
        expect(page).to have_content('Login required')
      end
    end
  end
end
