require 'rails_helper'

def login(user)
  visit login_path
  fill_in 'session_email', with: user.email
  fill_in 'session_password', with: user.password

  click_button 'Log in'
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
        visit new_post_path

        find('input#search').set("dota")
        find('#search-button').click

        search = find('input#search')

        expect(page).to have_selector('.videos')
      end
    end
  end

  context 'not logged in' do
  end
end
